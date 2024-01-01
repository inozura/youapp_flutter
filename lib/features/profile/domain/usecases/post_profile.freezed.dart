// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostProfileParams _$PostProfileParamsFromJson(Map<String, dynamic> json) {
  return _PostProfileParams.fromJson(json);
}

/// @nodoc
mixin _$PostProfileParams {
  String get displayName => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get birtday => throw _privateConstructorUsedError;
  String? get heroscope => throw _privateConstructorUsedError;
  String? get zodiac => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  Object? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostProfileParamsCopyWith<PostProfileParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostProfileParamsCopyWith<$Res> {
  factory $PostProfileParamsCopyWith(
          PostProfileParams value, $Res Function(PostProfileParams) then) =
      _$PostProfileParamsCopyWithImpl<$Res, PostProfileParams>;
  @useResult
  $Res call(
      {String displayName,
      String? gender,
      String? birtday,
      String? heroscope,
      String? zodiac,
      int? height,
      int? weight,
      Object? image});
}

/// @nodoc
class _$PostProfileParamsCopyWithImpl<$Res, $Val extends PostProfileParams>
    implements $PostProfileParamsCopyWith<$Res> {
  _$PostProfileParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? gender = freezed,
    Object? birtday = freezed,
    Object? heroscope = freezed,
    Object? zodiac = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birtday: freezed == birtday
          ? _value.birtday
          : birtday // ignore: cast_nullable_to_non_nullable
              as String?,
      heroscope: freezed == heroscope
          ? _value.heroscope
          : heroscope // ignore: cast_nullable_to_non_nullable
              as String?,
      zodiac: freezed == zodiac
          ? _value.zodiac
          : zodiac // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image ? _value.image : image,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostProfileParamsImplCopyWith<$Res>
    implements $PostProfileParamsCopyWith<$Res> {
  factory _$$PostProfileParamsImplCopyWith(_$PostProfileParamsImpl value,
          $Res Function(_$PostProfileParamsImpl) then) =
      __$$PostProfileParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      String? gender,
      String? birtday,
      String? heroscope,
      String? zodiac,
      int? height,
      int? weight,
      Object? image});
}

/// @nodoc
class __$$PostProfileParamsImplCopyWithImpl<$Res>
    extends _$PostProfileParamsCopyWithImpl<$Res, _$PostProfileParamsImpl>
    implements _$$PostProfileParamsImplCopyWith<$Res> {
  __$$PostProfileParamsImplCopyWithImpl(_$PostProfileParamsImpl _value,
      $Res Function(_$PostProfileParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? gender = freezed,
    Object? birtday = freezed,
    Object? heroscope = freezed,
    Object? zodiac = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? image = freezed,
  }) {
    return _then(_$PostProfileParamsImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birtday: freezed == birtday
          ? _value.birtday
          : birtday // ignore: cast_nullable_to_non_nullable
              as String?,
      heroscope: freezed == heroscope
          ? _value.heroscope
          : heroscope // ignore: cast_nullable_to_non_nullable
              as String?,
      zodiac: freezed == zodiac
          ? _value.zodiac
          : zodiac // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image ? _value.image : image,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostProfileParamsImpl implements _PostProfileParams {
  const _$PostProfileParamsImpl(
      {this.displayName = "",
      this.gender = "",
      this.birtday = "",
      this.heroscope = "",
      this.zodiac = "",
      this.height = 0,
      this.weight = 0,
      this.image = ""});

  factory _$PostProfileParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostProfileParamsImplFromJson(json);

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String? gender;
  @override
  @JsonKey()
  final String? birtday;
  @override
  @JsonKey()
  final String? heroscope;
  @override
  @JsonKey()
  final String? zodiac;
  @override
  @JsonKey()
  final int? height;
  @override
  @JsonKey()
  final int? weight;
  @override
  @JsonKey()
  final Object? image;

  @override
  String toString() {
    return 'PostProfileParams(displayName: $displayName, gender: $gender, birtday: $birtday, heroscope: $heroscope, zodiac: $zodiac, height: $height, weight: $weight, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostProfileParamsImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birtday, birtday) || other.birtday == birtday) &&
            (identical(other.heroscope, heroscope) ||
                other.heroscope == heroscope) &&
            (identical(other.zodiac, zodiac) || other.zodiac == zodiac) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayName,
      gender,
      birtday,
      heroscope,
      zodiac,
      height,
      weight,
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostProfileParamsImplCopyWith<_$PostProfileParamsImpl> get copyWith =>
      __$$PostProfileParamsImplCopyWithImpl<_$PostProfileParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostProfileParamsImplToJson(
      this,
    );
  }
}

abstract class _PostProfileParams implements PostProfileParams {
  const factory _PostProfileParams(
      {final String displayName,
      final String? gender,
      final String? birtday,
      final String? heroscope,
      final String? zodiac,
      final int? height,
      final int? weight,
      final Object? image}) = _$PostProfileParamsImpl;

  factory _PostProfileParams.fromJson(Map<String, dynamic> json) =
      _$PostProfileParamsImpl.fromJson;

  @override
  String get displayName;
  @override
  String? get gender;
  @override
  String? get birtday;
  @override
  String? get heroscope;
  @override
  String? get zodiac;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  Object? get image;
  @override
  @JsonKey(ignore: true)
  _$$PostProfileParamsImplCopyWith<_$PostProfileParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
