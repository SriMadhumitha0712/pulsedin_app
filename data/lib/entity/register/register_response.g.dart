// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseEntity _$RegisterResponseEntityFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseEntity(
      message: json['message'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$RegisterResponseEntityToJson(
        RegisterResponseEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
