// import 'package:examscholars_online/util/phone_no_formatter.dart';
// import 'package:url_launcher/url_launcher.dart' as launcher;
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class UrlLauncher {
//   static Future<void> launchUrl(String url) async {
//     if (!await launcher.launchUrl(
//       Uri.parse(url),
//       mode: launcher.LaunchMode.externalApplication,
//     )) {
//       debugPrint('Could not launch $url');
//     }
//   }

//   static Future<void> launchWhatsapp(String? message, String phone) async {
//     final formattedPhone = PhoneNoFormatter(phone).internationalize().phone;
//     final url = Uri.encodeFull(
//       // 'https://wa.me/?${phone == null ? '' : 'phone=$phone&'}text=${message ?? ''}',
//       'https://wa.me/$formattedPhone?text=${message ?? ''}',
//     );
//     final launchUri = Uri.parse(url);
//     await launch(launchUri);
//   }

//   static Future<void> makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(
//       scheme: 'tel',
//       path: phoneNumber,
//     );
//     await launch(launchUri);
//     // if (!(await launcher.launchUrl(launchUri))) {
//     //   debugPrint('Could not launch $phoneNumber');
//     // }
//   }

//   static Future<void> launchSmsMessage(String phoneNumber) async {
//     final Uri launchUri = Uri(
//       scheme: 'sms',
//       path: phoneNumber,
//     );
//     await launch(launchUri);
//     // if (!(await launcher.launchUrl(launchUri))) {
//     //   debugPrint('Could not launch $phoneNumber');
//     // }
//   }

//   static Future<void> launchEmailMessage(String recipient,
//       [String subject = '', String body = '']) async {
//     final Uri launchUri = Uri(
//       scheme: 'mailto',
//       path: '$recipient?subject=$subject&body=$body',
//     );
//     await launch(launchUri);
//     // if (!(await launcher.launchUrl(launchUri))) {
//     //   debugPrint('Could not launch your email app');
//     // }
//   }

//   static Future<void> launch(
//     Uri launchUri, [
//     LaunchMode mode = LaunchMode.externalApplication,
//   ]) async {
//     if (await launcher.canLaunchUrl(launchUri)) {
//       await launcher.launchUrl(launchUri, mode: mode);
//     } else {
//       debugPrint('Could not launch $launchUri');
//     }
//   }

//   // void _launchEmail() async {
//   //   final Uri emailLaunchUri = Uri(
//   //     scheme: 'mailto',
//   //     path: 'recipient@example.com?subject=Your Subject&body=Your Email Body',
//   //   );

//   //   if (await canLaunchUrl(emailLaunchUri)) {
//   //     await launchUrl(emailLaunchUri);
//   //   } else {
//   //     // Handle case where no email app is found
//   //     print('Could not launch email app');
//   //   }
//   // }
// }
