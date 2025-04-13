import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/controllers/auth/login.dart';
import 'package:ticket_scanner/controllers/dashboard.dart';
import 'package:ticket_scanner/controllers/splash_screen_page.dart';
import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // navigatorKey: navigatorKey,
      title: 'Shopurban Ticket Scanner',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: AppColors.pinkPrimary,
        fontFamily: "Roboto",
        primarySwatch: AppColors.pinkPrimary,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: AppColors.pinkPrimary,
          accentColor: AppColors.secondary,
        ),
      ),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreenPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/dashboard', page: () => const DashboardPage()),
      ],
    );
  }
}

Future<void> _init() async {
  await PrefsHandler.init();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

  // HttpClient createHttpClient(SecurityContext? context) {
  //   final client = super.createHttpClient(context);
  //   client.findProxy = (uri) => "DIRECT";
  //   client.connectionFactory = (address, port, {sourceAddress, timeout}) {
  //     return Socket.connect(address.address, port,
  //       timeout: timeout ?? const Duration(seconds: 5),
  //       sourceAddress: InternetAddress.anyIPv4);
  //   };
  //   return client;
  // }
}
