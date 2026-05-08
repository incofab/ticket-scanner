// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      id: (json['id'] as num).toInt(),
      seat_section_id: (json['seat_section_id'] as num).toInt(),
      seat_no: json['seat_no'] as String,
      description: json['description'] as String?,
      features: json['features'] as String?,
      seatSection: json['seatSection'] == null
          ? null
          : SeatSection.fromJson(json['seatSection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'id': instance.id,
      'seat_section_id': instance.seat_section_id,
      'seat_no': instance.seat_no,
      'description': instance.description,
      'features': instance.features,
      'seatSection': instance.seatSection,
    };
