// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPackage _$EventPackageFromJson(Map<String, dynamic> json) => EventPackage(
      id: (json['id'] as num).toInt(),
      event_id: (json['event_id'] as num).toInt(),
      seat_section_id: (json['seat_section_id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      quantity_sold: (json['quantity_sold'] as num).toInt(),
      entry_gate: json['entry_gate'] as String?,
      title: json['title'] as String,
      notes: json['notes'] as String?,
      capacity: (json['capacity'] as num).toInt(),
      event: json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventPackageToJson(EventPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'seat_section_id': instance.seat_section_id,
      'price': instance.price,
      'quantity_sold': instance.quantity_sold,
      'entry_gate': instance.entry_gate,
      'title': instance.title,
      'notes': instance.notes,
      'capacity': instance.capacity,
      'event': instance.event,
    };
