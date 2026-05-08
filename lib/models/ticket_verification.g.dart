// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketVerification _$TicketVerificationFromJson(Map<String, dynamic> json) =>
    TicketVerification(
      id: (json['id'] as num).toInt(),
      ticket_id: (json['ticket_id'] as num).toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      reference: json['reference'] as String,
      device_no: json['device_no'] as String,
      ticket: json['ticket'] == null
          ? null
          : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketVerificationToJson(TicketVerification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticket_id': instance.ticket_id,
      'user_id': instance.user_id,
      'reference': instance.reference,
      'device_no': instance.device_no,
      'ticket': instance.ticket,
    };
