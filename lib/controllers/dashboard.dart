import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_scanner/components/empty_records.dart';
import 'package:ticket_scanner/components/loading.dart';
import 'package:ticket_scanner/controllers/show_event_page.dart';
import 'package:ticket_scanner/dto/paginated_data.dart';
import 'package:ticket_scanner/layout/page_layout.dart';
import 'package:ticket_scanner/models/event.dart';
import 'package:ticket_scanner/support/prefs_handler.dart';
import 'package:ticket_scanner/util/helpers.dart';
import 'package:ticket_scanner/util/network/network_request.dart';
import 'package:ticket_scanner/util/network/base_response.dart';
import 'package:ticket_scanner/util/url.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Event> events = [];
  bool isLoading = false;

  Future<List<Event>?> loadEvents() async {
    final responseData = await NetworkRequest.get<BaseResponse>(
      Url.listEvents,
      isLoading: (isLoading) => setState(() => this.isLoading = isLoading),
      responseHandler: (response) {},
      onFail: (message) => Helpers.showMessage(message),
    );
    final eventsMap = responseData['data']?['data'] as List<dynamic>?;
    if (eventsMap == null) {
      Helpers.showMessage('No events found');
      return [];
    }
    // print(['eventsJson', eventsMap]);

    final events = eventsMap.map((e) => Event.fromJson(e)).toList();
    // Save to prefs
    unawaited(PrefsHandler.saveEvents(events));

    return events;
  }

  void setEvents() async {
    var events = PrefsHandler.getEvents();
    if (events.isEmpty) {
      events = await loadEvents() ?? [];
    }
    setState(() => this.events = events);
  }

  @override
  void initState() {
    super.initState();
    setEvents();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      title: 'Dashboard',
      backgroundColor: Colors.white,
      appBarActions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () async {
            final events = await loadEvents();
            setState(() => this.events = events ?? []);
          },
        ),
        const SizedBox(width: 5),
      ],
      child: isLoading
          ? const Loading()
          : events.isEmpty
              ? const EmptyRecords()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var event in events) _EventCard(event: event),
                    ],
                  ),
                ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final Event event;
  const _EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          print(['Event', event.toJson()]);
          Get.to(ShowEventPage(event: event));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              event.logoUrl,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          event.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      event.start_time != null
                          ? const SizedBox.shrink()
                          : Text(
                              DateFormat(Helpers.DATE_TIME_FORMAT)
                                  .format(DateTime.parse(event.start_time!))
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    event.venue ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
