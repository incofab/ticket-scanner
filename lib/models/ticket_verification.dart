import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_scanner/models/ticket.dart';

part 'ticket_verification.g.dart';

@JsonSerializable()
class TicketVerification {
  int id;
  int ticket_id;
  int? user_id;
  String reference;
  String device_no;

  Ticket? ticket;

  TicketVerification({
    required this.id,
    required this.ticket_id,
    this.user_id,
    required this.reference,
    required this.device_no,
    this.ticket,
  });

  factory TicketVerification.fromJson(Map<String, dynamic> json) =>
      _$TicketVerificationFromJson(json);

  Map<String, dynamic> toJson() => _$TicketVerificationToJson(this);
}
