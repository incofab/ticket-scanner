import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_scanner/models/event.dart';

part 'event_package.g.dart';

@JsonSerializable()
class EventPackage {
  int id;
  int event_id;
  int seat_section_id;
  double price;
  int quantity_sold;
  String? entry_gate;
  String title;
  String? notes;
  int capacity;

  Event? event;

  EventPackage({
    required this.id,
    required this.event_id,
    required this.seat_section_id,
    required this.price,
    required this.quantity_sold,
    this.entry_gate,
    required this.title,
    this.notes,
    required this.capacity,
    this.event,
  });

  factory EventPackage.fromJson(Map<String, dynamic> json) => _$EventPackageFromJson(json);

  Map<String, dynamic> toJson() => _$EventPackageToJson(this);
}
