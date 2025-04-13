import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/controllers/auth/login.dart';
import 'package:ticket_scanner/controllers/dashboard.dart';
import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/app_colors.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    handlePageNavigation();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.dispose();
  }

  void handlePageNavigation() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      var token = PrefsHandler.getToken();
      if (token == null) {
        Get.off(const LoginPage());
      } else {
        Get.off(const DashboardPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.pinkPrimary.withAlpha(150),
              Colors.white.withAlpha(150),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 1),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 120,
                  child: ClipOval(
                    child: Icon(Icons.qr_code_scanner,
                        size: 200, color: AppColors.pinkPrimary),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Shopurban Ticket Scanner',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(height: 1),
            Padding(
              padding: EdgeInsets.only(bottom: 7),
              child: Text(
                'Powering your event efficiently',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
