import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_scanner/models/event_package.dart';
import 'package:ticket_scanner/models/seat.dart';
import 'package:ticket_scanner/models/ticket_payment.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  int id;
  String reference;
  String qr_code;

  @JsonKey(name: 'event_package')
  EventPackage? eventPackage;
  @JsonKey(name: 'ticket_payment')
  TicketPayment? ticketPayment;
  Seat? seat;

  Ticket({
    required this.id,
    required this.qr_code,
    required this.reference,
    this.seat,
    this.eventPackage,
    this.ticketPayment,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
