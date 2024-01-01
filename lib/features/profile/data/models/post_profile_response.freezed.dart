// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostProfileResponse _$PostProfileResponseFromJson(Map<String, dynamic> json) {
  return _PostProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$PostProfileResponse {
  bool? get success => throw _privateConstructorUsedError;
  DataProfile? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostProfileResponseCopyWith<PostProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostProfileResponseCopyWith<$Res> {
  factory $PostProfileResponseCopyWith(
          PostProfileResponse value, $Res Function(PostProfileResponse) then) =
      _$PostProfileResponseCopyWithImpl<$Res, PostProfileResponse>;
  @useResult
  $Res call({bool? success, DataProfile? data});

  $DataProfileCopyWith<$Res>? get data;
}

/// @nodoc
class _$PostProfileResponseCopyWithImpl<$Res, $Val extends PostProfileResponse>
    implements $PostProfileResponseCopyWith<$Res> {
  _$PostProfileResponseCopyWithImpl(this._value, this._then);

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
              as DataProfile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataProfileCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataProfileCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostProfileResponseImplCopyWith<$Res>
    implements $PostProfileResponseCopyWith<$Res> {
  factory _$$PostProfileResponseImplCopyWith(_$PostProfileResponseImpl value,
          $Res Function(_$PostProfileResponseImpl) then) =
      __$$PostProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, DataProfile? data});

  @override
  $DataProfileCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PostProfileResponseImplCopyWithImpl<$Res>
    extends _$PostProfileResponseCopyWithImpl<$Res, _$PostProfileResponseImpl>
    implements _$$PostProfileResponseImplCopyWith<$Res> {
  __$$PostProfileResponseImplCopyWithImpl(_$PostProfileResponseImpl _value,
      $Res Function(_$PostProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PostProfileResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostProfileResponseImpl extends _PostProfileResponse {
  const _$PostProfileResponseImpl({this.success, this.data}) : super._();

  factory _$PostProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostProfileResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final DataProfile? data;

  @override
  String toString() {
    return 'PostProfileResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostProfileResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostProfileResponseImplCopyWith<_$PostProfileResponseImpl> get copyWith =>
      __$$PostProfileResponseImplCopyWithImpl<_$PostProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _PostProfileResponse extends PostProfileResponse {
  const factory _PostProfileResponse(
      {final bool? success,
      final DataProfile? data}) = _$PostProfileResponseImpl;
  const _PostProfileResponse._() : super._();

  factory _PostProfileResponse.fromJson(Map<String, dynamic> json) =
      _$PostProfileResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  DataProfile? get data;
  @override
  @JsonKey(ignore: true)
  _$$PostProfileResponseImplCopyWith<_$PostProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
