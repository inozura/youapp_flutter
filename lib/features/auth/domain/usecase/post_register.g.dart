// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      email: json['email'] as String? ?? "",
      username: json['username'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
