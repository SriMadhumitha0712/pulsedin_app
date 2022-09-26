

import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponseEntity {
  final bool? status;
  final String? message;

  RegisterResponseEntity({
    this.message,
    this.status,
  });

  @override
  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseEntityToJson(this);
}
