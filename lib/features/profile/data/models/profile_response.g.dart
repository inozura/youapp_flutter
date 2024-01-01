// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseImpl _$$ProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileResponseImpl(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : DataProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileResponseImplToJson(
        _$ProfileResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data?.toJson(),
    };

_$DataProfileImpl _$$DataProfileImplFromJson(Map<String, dynamic> json) =>
    _$DataProfileImpl(
      userId: json['userId'] as String?,
      displayName: json['displayName'] as String?,
      image: json['image'] as String?,
      gender: json['gender'] as String?,
      date: json['date'] as String?,
      heroscope: json['heroscope'] as String?,
      zodiac: json['zodiac'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      interest: (json['interest'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DataProfileImplToJson(_$DataProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'displayName': instance.displayName,
      'image': instance.image,
      'gender': instance.gender,
      'date': instance.date,
      'heroscope': instance.heroscope,
      'zodiac': instance.zodiac,
      'height': instance.height,
      'weight': instance.weight,
      'interest': instance.interest,
    };
