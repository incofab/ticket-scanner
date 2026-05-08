import 'package:json_annotation/json_annotation.dart';

part 'ticket_payment.g.dart';

@JsonSerializable()
class TicketPayment {
  int id;
  int quantity;
  int event_package_id;
  int? user_id;
  String? name;
  String? phone;
  String? email;

  TicketPayment({
    required this.id,
    required this.quantity,
    required this.event_package_id,
    this.user_id,
    this.name,
    this.phone,
    this.email,
  });

  factory TicketPayment.fromJson(Map<String, dynamic> json) => _$TicketPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$TicketPaymentToJson(this);
}
