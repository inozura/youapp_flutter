// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostProfileParamsImpl _$$PostProfileParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PostProfileParamsImpl(
      displayName: json['displayName'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      birtday: json['birtday'] as String? ?? "",
      heroscope: json['heroscope'] as String? ?? "",
      zodiac: json['zodiac'] as String? ?? "",
      height: json['height'] as int? ?? 0,
      weight: json['weight'] as int? ?? 0,
      image: json['image'] ?? "",
    );

Map<String, dynamic> _$$PostProfileParamsImplToJson(
        _$PostProfileParamsImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'gender': instance.gender,
      'birtday': instance.birtday,
      'heroscope': instance.heroscope,
      'zodiac': instance.zodiac,
      'height': instance.height,
      'weight': instance.weight,
      'image': instance.image,
    };
