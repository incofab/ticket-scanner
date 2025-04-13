import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_scanner/models/event.dart';
import 'package:ticket_scanner/models/user.dart';
import 'package:ticket_scanner/util/helpers.dart';

class PrefsHandler {
  static const String PREFS_LOGIN_TOKEN = 'login_token';
  static const String PREFS_DEVICE_ID = 'device_id';
  static const String PREFS_USER_DATA = 'user_data';
  static const String PREFS_EVENTS = 'events';
  static SharedPreferences? prefs;

  static Future<void> init([bool retry = true]) async {
    if (prefs != null) {
      return;
    }
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      if (retry) {
        // await deleteSharedPreferencesFile();
      }
    }
  }

  static Future<void> saveDeviceId(String deviceId) async {
    await prefs?.setString(PREFS_DEVICE_ID, deviceId);
  }

  static String? getDeviceId() {
    var deviceNo = prefs?.getString(PREFS_DEVICE_ID);
    if (deviceNo == null) {
      deviceNo = Helpers.generateReference();
      unawaited(saveDeviceId(deviceNo));
    }
    return deviceNo;
  }

  static Future<void> saveToken(String token) async {
    await prefs?.setString(PREFS_LOGIN_TOKEN, token);
  }

  static String? getToken() {
    return prefs?.getString(PREFS_LOGIN_TOKEN);
  }

  static Future<void> saveUser(User user) async {
    await prefs?.setString(PREFS_USER_DATA, jsonEncode(user.toJson()));
  }

  static User? getUser() {
    String? userJson = prefs?.getString(PREFS_USER_DATA);
    return userJson == null ? null : User.fromJson(jsonDecode(userJson));
  }

  static Future<void> saveEvents(List<Event> events) async {
    List<Map<String, dynamic>> eventsJson =
        events.map((e) => e.toJson()).toList();
    await saveEventsJson(jsonEncode(events));
  }

  static Future<void> saveEventsJson(String events) async {
    await prefs?.setString(PREFS_EVENTS, events);
  }

  static List<Event> getEvents() {
    try {
      String? eventsJson = prefs?.getString(PREFS_EVENTS);
      if (eventsJson == null) {
        return [];
      }
      List<dynamic> events = jsonDecode(eventsJson);
      return events.map((e) => Event.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
