// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String? email;
  final String? password;
  final String? user_type;
  final String? first_name;
  final String? last_name;

  RegisterRequest({
    this.email,
    this.password,
    this.user_type,
    this.first_name,
    this.last_name,
  });

  @override
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
