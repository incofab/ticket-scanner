import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  int id;
  String title;
  String? description;
  String? start_time;
  String? end_time;
  String? home_team;
  String? away_team;
  String? venue;
  String? phone;
  String? email;
  String? website;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? tiktok;
  String? linkedin;
  String? logo;

  Event({
    required this.id,
    required this.title,
    this.description,
    this.start_time,
    this.end_time,
    this.home_team,
    this.away_team,
    this.venue,
    this.phone,
    this.email,
    this.website,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.tiktok,
    this.linkedin,
    this.logo,
  });

  get logoUrl {
    if (logo != null) {
      return logo;
    }
    final encodedName = Uri.encodeComponent(title);
    return "https://ui-avatars.com/api/?name={$encodedName}";
  }

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
