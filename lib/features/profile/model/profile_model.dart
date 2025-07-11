import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String id;
  final String username;
  final String email;
  final String city;
  final String dob;

  ProfileModel({
    required this.id,
    required this.username,
    required this.email,
    required this.city,
    required this.dob,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
