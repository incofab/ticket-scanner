// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatSection _$SeatSectionFromJson(Map<String, dynamic> json) => SeatSection(
      id: (json['id'] as num).toInt(),
      capacity: (json['capacity'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      features: json['features'] as String?,
    );

Map<String, dynamic> _$SeatSectionToJson(SeatSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capacity': instance.capacity,
      'title': instance.title,
      'description': instance.description,
      'features': instance.features,
    };
