import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Helpers {
  static const String DATE_TIME_FORMAT = 'yyyy-MM-dd HH:mm:ss';
  static const String DATE_FORMAT = 'yyyy-MM-dd';
  static const String ACTIVATION_CODE_PREFIX = 'A';
  // static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // static void showMessage(BuildContext context, String message,
  //     {VoidCallback? action}) {
  //   debugPrint('SnackBar Message: $message');
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text(message),
  //     action: action != null
  //         ? SnackBarAction(
  //             onPressed: action,
  //             label: 'Here',
  //             textColor: Colors.grey,
  //           )
  //         : null,
  //   ));
  // }

  static void showMessage(String message) {
    debugPrint('SnackBar Message: $message');
    Get.showSnackbar(GetSnackBar(
      title: "Notification",
      duration: const Duration(milliseconds: 1500),
      messageText: Text(
        message,
        style: TextStyle(color: Colors.white.withOpacity(.6)),
      ),
    ));
  }

  static String addSeparator(String str,
      {String separator = ' ', int interval = 4}) {
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      buffer.write(str[i]);
      if ((i + 1) % interval == 0 && i != str.length - 1) {
        buffer.write(separator);
      }
    }
    return buffer.toString();
  }

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool containsOnlyDigits(String text) {
    // Define a regular expression to match only digits
    RegExp digitRegExp = RegExp(r'^[0-9]+$');
    // Use RegExp's test method to check if the text matches the pattern
    return digitRegExp.hasMatch(text);
  }

  static bool isActivationCode(String text) {
    return text.isNotEmpty && text[0].toUpperCase() == ACTIVATION_CODE_PREFIX;
  }

  static String trimText(String text) {
    return text.trim().replaceAll(RegExp(r'[- ]'), '');
  }

  static String generateReference() {
    final random = Random();
    final num = (random.nextInt(900000000) + 1000000000).toString();
    return '${DateTime.now().millisecondsSinceEpoch.toString()}$num';
  }
}
