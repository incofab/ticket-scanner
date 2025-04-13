import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/actions/verify_ticket.dart';
import 'package:ticket_scanner/components/brands/brand_elevated_button.dart';
import 'package:ticket_scanner/controllers/scanner_screen.dart';
import 'package:ticket_scanner/dialogs/message_dialog.dart';
import 'package:ticket_scanner/layout/page_layout.dart';
import 'package:ticket_scanner/models/event.dart';
import 'package:ticket_scanner/util/helpers.dart';

class ShowEventPage extends StatefulWidget {
  final Event event;
  const ShowEventPage({super.key, required this.event});

  @override
  State<ShowEventPage> createState() => _ShowEventPageState();
}

class _ShowEventPageState extends State<ShowEventPage> {
  bool isLoading = false;

  List<Map<String, dynamic>> getData() {
    return [
      {
        'label': 'Title',
        'value': widget.event.title,
      },
      {
        'label': 'Venue',
        'value': widget.event.venue,
      },
      // {
      //   'label': 'Start Time',
      //   'value': widget.event.start_time,
      // },
      // {
      //   'label': 'End Time',
      //   'value': widget.event.end_time,
      // },
      // {
      //   'label': 'Phone',
      //   'value': widget.event.phone,
      // },
      // {
      //   'label': 'Email',
      //   'value': widget.event.email,
      // },
      // {
      //   'label': 'Website',
      //   'value': widget.event.website,
      // },
      // {
      //   'label': 'Facebook',
      //   'value': widget.event.facebook,
      // },
      // {
      //   'label': 'Twitter',
      //   'value': widget.event.twitter,
      // },
      // {
      //   'label': 'Instagram',
      //   'value': widget.event.instagram,
      // },
      // {
      //   'label': 'Youtube',
      //   'value': widget.event.youtube,
      // },
      // {
      //   'label': 'Tiktok',
      //   'value': widget.event.tiktok,
      // },
      // {
      //   'label': 'LinkedIn',
      //   'value': widget.event.linkedin,
      // },
    ];
  }

  void onCodeDetected(String? code) async {
    if (code == null || !code.contains('|')) {
      Helpers.showMessage('Invalid code detected');
      return;
    }
    var [hash, ticketPaymentId] = code.split('|');
    final res = await VerifyTicket(widget.event).run(
      isLoading: (p0) => setState(() => isLoading = p0),
      ticketPaymentId: int.parse(ticketPaymentId),
      hash: hash,
    );

    if (!mounted) {
      return;
    }

    final title = res['title'] ?? 'Something Went Wrong';
    final message = res['message'] ??
        'Couldn’t verify ticket. Please check your connection or try again.';
    final slug = res['slug'] ?? 'error';

    _showMessage(context, title, message);

    // if (slug == VerifyTicket.SLUG_VERIFIED) {
    //   _showMessage(context, 'Verification Successful',
    //       'Congratulations! Your ticket has been verified successfully.');
    // } else if (slug == VerifyTicket.SLUG_INVALID_TICKET) {
    //   _showMessage(
    //     context,
    //     'Invalid Ticket!!!',
    //     'This ticket is invalid. Please check the code and try again.',
    //   );
    // } else if (slug == VerifyTicket.SLUG_ALREADY_VERIFIED) {
    //   _showMessage(context, 'Verification Successful',
    //       'Congratulations! This ticket has already been verified.');
    // } else {
    //   _showMessage(context, 'Error!!!',
    //       'An error occurred while verifying your ticket. Please try again.');
    // }
  }

  void _showMessage(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) => MessageDialog(
        title,
        message,
        () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Text('Show: dkdmksjndsj dsjndjskds ${widget.event.title}');
    return PageLayout(
      title: widget.event.title,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.event.logoUrl,
              fit: BoxFit.cover,
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 10),
            BrandElevatedButton(
              onPressed: () {
                // onCodeDetected('1234567890|1234567890');
                // return;
                Get.to(ScannerScreen(onCodeDetected: onCodeDetected));
              },
              label: 'Verify Ticket',
              isLoading: isLoading,
              icon: Icons.qr_code_scanner_rounded,
            ),
            const SizedBox(height: 10),
            for (var eventProp in getData())
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        eventProp['label'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(eventProp['value'] ?? '')
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
