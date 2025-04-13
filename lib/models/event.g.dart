// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      home_team: json['home_team'] as String?,
      away_team: json['away_team'] as String?,
      venue: json['venue'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      instagram: json['instagram'] as String?,
      youtube: json['youtube'] as String?,
      tiktok: json['tiktok'] as String?,
      linkedin: json['linkedin'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'home_team': instance.home_team,
      'away_team': instance.away_team,
      'venue': instance.venue,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'instagram': instance.instagram,
      'youtube': instance.youtube,
      'tiktok': instance.tiktok,
      'linkedin': instance.linkedin,
      'logo': instance.logo,
    };
