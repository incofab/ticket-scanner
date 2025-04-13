import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_scanner/components/brands/brand_elevated_button.dart';
import 'package:ticket_scanner/layout/page_layout.dart';

class ScannerScreen extends StatelessWidget {
  final Function(String) onCodeDetected;
  ScannerScreen({super.key, required this.onCodeDetected});

  bool isCaptured = false;
  final String barcodeResult = "Point the camera at a barcode/QR code";

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: "Scanner",
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: MobileScanner(
              onDetect: (BarcodeCapture capture) {
                if (isCaptured) {
                  return;
                }
                final List<Barcode> barcodes = capture.barcodes;
                if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
                  isCaptured = true;
                  Get.close(1);
                  onCodeDetected(barcodes.first.rawValue!);
                }
              },
            ),
          ),
          BrandElevatedButton.accent(
            label: "Close",
            onPressed: () {
              // onCodeDetected('24490343|232');
              Get.close(1);
            },
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                barcodeResult,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
