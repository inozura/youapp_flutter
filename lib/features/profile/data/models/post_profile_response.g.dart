// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostProfileResponseImpl _$$PostProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostProfileResponseImpl(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : DataProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostProfileResponseImplToJson(
        _$PostProfileResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
    };
