// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileImageResponse _$ProfileImageResponseFromJson(Map<String, dynamic> json) {
  return _ProfileImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileImageResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileImageResponseCopyWith<ProfileImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileImageResponseCopyWith<$Res> {
  factory $ProfileImageResponseCopyWith(ProfileImageResponse value,
          $Res Function(ProfileImageResponse) then) =
      _$ProfileImageResponseCopyWithImpl<$Res, ProfileImageResponse>;
  @useResult
  $Res call({bool? success, String? data});
}

/// @nodoc
class _$ProfileImageResponseCopyWithImpl<$Res,
        $Val extends ProfileImageResponse>
    implements $ProfileImageResponseCopyWith<$Res> {
  _$ProfileImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImageResponseImplCopyWith<$Res>
    implements $ProfileImageResponseCopyWith<$Res> {
  factory _$$ProfileImageResponseImplCopyWith(_$ProfileImageResponseImpl value,
          $Res Function(_$ProfileImageResponseImpl) then) =
      __$$ProfileImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? data});
}

/// @nodoc
class __$$ProfileImageResponseImplCopyWithImpl<$Res>
    extends _$ProfileImageResponseCopyWithImpl<$Res, _$ProfileImageResponseImpl>
    implements _$$ProfileImageResponseImplCopyWith<$Res> {
  __$$ProfileImageResponseImplCopyWithImpl(_$ProfileImageResponseImpl _value,
      $Res Function(_$ProfileImageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProfileImageResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImageResponseImpl extends _ProfileImageResponse {
  const _$ProfileImageResponseImpl({this.success, this.data}) : super._();

  factory _$ProfileImageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImageResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? data;

  @override
  String toString() {
    return 'ProfileImageResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImageResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImageResponseImplCopyWith<_$ProfileImageResponseImpl>
      get copyWith =>
          __$$ProfileImageResponseImplCopyWithImpl<_$ProfileImageResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImageResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfileImageResponse extends ProfileImageResponse {
  const factory _ProfileImageResponse(
      {final bool? success, final String? data}) = _$ProfileImageResponseImpl;
  const _ProfileImageResponse._() : super._();

  factory _ProfileImageResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileImageResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImageResponseImplCopyWith<_$ProfileImageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
