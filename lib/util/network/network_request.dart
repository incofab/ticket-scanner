import 'dart:convert';

import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/network/base_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  NetworkRequest();

  static bool _isResponseValid(http.Response response) {
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<dynamic> post<T>(
    String url, {
    Map<String, dynamic>? params,
    required Function(bool isLoading) isLoading,
    Function(dynamic decodedResponse)? responseHandler,
    Function(BaseResponse<T?> response)? callback,
    required Function(String message) onFail,
    Function(http.Response response)? responseData,
  }) async {
    try {
      debugPrint('calling $url, with Params: ${params.toString()}');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${PrefsHandler.getToken()}',
      };
      isLoading(true);
      debugPrint("Step 1");
      http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          ...(params ?? {}),
          // 'partner': PartnerParams.instance.partnerUsername
        }),
      );
      debugPrint("Step 2");

      if (!_isResponseValid(response)) {
        debugPrint('Error response');
        debugPrint(response.body);
        onFail(response.body);
        return {};
      }

      debugPrint("Step 3");
      final decodedBody = jsonDecode(response.body);

      debugPrint("Before Json decode");
      debugPrint(decodedBody.toString());
      // Using responseHandler means you want to handle the data yourself
      if (responseHandler != null) {
        responseHandler(decodedBody);
        return decodedBody;
      }
      debugPrint("Step 4");

      final baseResponse = BaseResponse.fromJson<T>(decodedBody);
      if (!baseResponse.isSuccessful()) {
        onFail(baseResponse.message ?? '');
        return decodedBody;
      }

      debugPrint("Step 5");
      if (callback != null) {
        callback(baseResponse);
      }
      debugPrint("After Json decode");
      return decodedBody;
    } catch (e, stackTrace) {
      debugPrint('Error processing request: ${e.toString()}');
      debugPrint("Stack trace:\n$stackTrace");
      onFail('Error processing request: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  static Future<dynamic> get<T>(
    String url, {
    required Function(bool isLoading) isLoading,
    Function(BaseResponse response)? callback,
    required Function(String message) onFail,
    Function(dynamic decodedResponse)? responseHandler,
    Function(http.Response response)? responseData,
  }) async {
    try {
      debugPrint('Url = $url');
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      isLoading(true);
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      if (!_isResponseValid(response)) {
        debugPrint('Network Error: ${response.body.substring(0, 100)}...');
        onFail(response.body);
        return {};
      }
      debugPrint('Before json decode');
      debugPrint(response.body.toString());

      final decodedBody = jsonDecode(response.body);
      // Using responseHandler means you want to handle the data yourself
      if (responseHandler != null) {
        responseHandler(decodedBody);
        return decodedBody;
      }

      BaseResponse baseResponse = BaseResponse.fromJson<T>(decodedBody);
      debugPrint('After json decode');

      if (!baseResponse.isSuccessful()) {
        onFail(baseResponse.message ?? 'Operation not successful');
        return decodedBody;
      }
      if (callback != null) {
        callback(baseResponse);
      }
      return decodedBody;
    } catch (e, stackTrace) {
      debugPrint('Error processing request: ${e.toString()}');
      debugPrint("Stack trace:\n$stackTrace");
    } finally {
      isLoading(false);
    }
  }
}
