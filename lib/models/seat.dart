import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_scanner/models/seat_section.dart';

part 'seat.g.dart';

@JsonSerializable()
class Seat {
  int id;
  int seat_section_id;
  String seat_no;
  String? description;
  String? features;

  @JsonKey(name: 'seat_section')
  SeatSection? seatSection;

  Seat({
    required this.id,
    required this.seat_section_id,
    required this.seat_no,
    this.description,
    this.features,
    this.seatSection,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);
}
