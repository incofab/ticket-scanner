import 'package:json_annotation/json_annotation.dart';

part 'seat_section.g.dart';

@JsonSerializable()
class SeatSection {
  int id;
  int capacity;
  String title;
  String? description;
  String? features;

  SeatSection({
    required this.id,
    required this.capacity,
    required this.title,
    this.description,
    this.features,
  });

  factory SeatSection.fromJson(Map<String, dynamic> json) => _$SeatSectionFromJson(json);

  Map<String, dynamic> toJson() => _$SeatSectionToJson(this);
}
