import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String first_name;
  String? last_name;
  String? other_names;
  String? full_name;
  String? phone;
  String? email;

  User({
    required this.id,
    required this.first_name,
    this.last_name,
    this.other_names,
    this.full_name,
    this.phone,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
