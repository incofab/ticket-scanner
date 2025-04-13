import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/components/brands/brand_elevated_button.dart';
import 'package:ticket_scanner/components/brands/outlined_text_field.dart';
import 'package:ticket_scanner/controllers/dashboard.dart';
import 'package:ticket_scanner/layout/page_layout.dart';
import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/app_colors.dart';
import 'package:ticket_scanner/util/helpers.dart';
import 'package:ticket_scanner/util/network/network_request.dart';
import 'package:ticket_scanner/util/network/base_response.dart';
import 'package:ticket_scanner/util/url.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    // testConnection();
    // return;
    NetworkRequest.post<BaseResponse>(
      Url.login,
      params: {
        'phone': phoneController.text.trim(),
        'password': passwordController.text.trim(),
      },
      isLoading: (isLoading) => setState(() => this.isLoading = isLoading),
      responseHandler: (response) {
        //print(['response', response]);
        String? token = response['token'];
        String? message = response['message'] ??
            (token == null ? 'Error logging in' : 'Login successful');
        Helpers.showMessage(message!);
        // print([token, message]);

        if (token != null) {
          unawaited(PrefsHandler.saveToken(token));
          Get.off(const DashboardPage());
        }
      },
      onFail: (message) => Helpers.showMessage(message),
    );
  }

  void testConnection() async {
    try {
      String url = 'https://ticketapitest.shopurban.co/docs';
      print('Testing connection to $url...');
      final response = await http.get(Uri.parse(url));
      print('Status: ${response.statusCode}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Login",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80, color: AppColors.pinkPrimary),
            const SizedBox(height: 16),
            const Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.pinkPrimary,
              ),
            ),
            const SizedBox(height: 32),
            OutlinedTextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              labelText: "Phone Number",
              prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 16),
            OutlinedTextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              labelText: "Password",
              prefixIcon: Icons.lock_outline,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: BrandElevatedButton(
                onPressed: isLoading ? null : login,
                label: 'Login',
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
