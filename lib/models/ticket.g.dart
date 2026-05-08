// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: (json['id'] as num).toInt(),
      qr_code: json['qr_code'] as String,
      reference: json['reference'] as String,
      seat: json['seat'] == null
          ? null
          : Seat.fromJson(json['seat'] as Map<String, dynamic>),
      eventPackage: json['eventPackage'] == null
          ? null
          : EventPackage.fromJson(json['eventPackage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'qr_code': instance.qr_code,
      'eventPackage': instance.eventPackage,
      'seat': instance.seat,
    };
