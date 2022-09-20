// ignore_for_file: non_constant_identifier_names

import 'package:data/entity/base_entity.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity extends BaseEntity {
  @JsonKey(name: "token")
  final String token;
  final String user_type;

  LoginResponseEntity(
    bool? status,
    String? message,
    String? error,
    this.token,
    this.user_type,
  ) : super(status, message, error);

  factory LoginResponseEntity.fromJson(Map<String, dynamic> map) =>
      _$LoginResponseEntityFromJson(map);
  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
