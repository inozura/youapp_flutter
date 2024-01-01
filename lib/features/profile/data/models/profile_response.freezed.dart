// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return _ProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileResponse {
  bool? get success => throw _privateConstructorUsedError;
  DataProfile? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileResponseCopyWith<ProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileResponseCopyWith<$Res> {
  factory $ProfileResponseCopyWith(
          ProfileResponse value, $Res Function(ProfileResponse) then) =
      _$ProfileResponseCopyWithImpl<$Res, ProfileResponse>;
  @useResult
  $Res call({bool? success, DataProfile? data});

  $DataProfileCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res, $Val extends ProfileResponse>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileResponseImplCopyWith<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  factory _$$ProfileResponseImplCopyWith(_$ProfileResponseImpl value,
          $Res Function(_$ProfileResponseImpl) then) =
      __$$ProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, DataProfile? data});

  @override
  $DataProfileCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ProfileResponseImplCopyWithImpl<$Res>
    extends _$ProfileResponseCopyWithImpl<$Res, _$ProfileResponseImpl>
    implements _$$ProfileResponseImplCopyWith<$Res> {
  __$$ProfileResponseImplCopyWithImpl(
      _$ProfileResponseImpl _value, $Res Function(_$ProfileResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProfileResponseImpl(
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
class _$ProfileResponseImpl extends _ProfileResponse {
  const _$ProfileResponseImpl({this.success, this.data}) : super._();

  factory _$ProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final DataProfile? data;

  @override
  String toString() {
    return 'ProfileResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      __$$ProfileResponseImplCopyWithImpl<_$ProfileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileResponseImplToJson(
      this,
    );
  }
}

abstract class _ProfileResponse extends ProfileResponse {
  const factory _ProfileResponse(
      {final bool? success, final DataProfile? data}) = _$ProfileResponseImpl;
  const _ProfileResponse._() : super._();

  factory _ProfileResponse.fromJson(Map<String, dynamic> json) =
      _$ProfileResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  DataProfile? get data;
  @override
  @JsonKey(ignore: true)
  _$$ProfileResponseImplCopyWith<_$ProfileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) {
  return _DataProfile.fromJson(json);
}

/// @nodoc
mixin _$DataProfile {
  String? get userId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get heroscope => throw _privateConstructorUsedError;
  String? get zodiac => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  List<String>? get interest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataProfileCopyWith<DataProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataProfileCopyWith<$Res> {
  factory $DataProfileCopyWith(
          DataProfile value, $Res Function(DataProfile) then) =
      _$DataProfileCopyWithImpl<$Res, DataProfile>;
  @useResult
  $Res call(
      {String? userId,
      String? displayName,
      String? image,
      String? gender,
      String? date,
      String? heroscope,
      String? zodiac,
      int? height,
      int? weight,
      List<String>? interest});
}

/// @nodoc
class _$DataProfileCopyWithImpl<$Res, $Val extends DataProfile>
    implements $DataProfileCopyWith<$Res> {
  _$DataProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? image = freezed,
    Object? gender = freezed,
    Object? date = freezed,
    Object? heroscope = freezed,
    Object? zodiac = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? interest = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      interest: freezed == interest
          ? _value.interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataProfileImplCopyWith<$Res>
    implements $DataProfileCopyWith<$Res> {
  factory _$$DataProfileImplCopyWith(
          _$DataProfileImpl value, $Res Function(_$DataProfileImpl) then) =
      __$$DataProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? displayName,
      String? image,
      String? gender,
      String? date,
      String? heroscope,
      String? zodiac,
      int? height,
      int? weight,
      List<String>? interest});
}

/// @nodoc
class __$$DataProfileImplCopyWithImpl<$Res>
    extends _$DataProfileCopyWithImpl<$Res, _$DataProfileImpl>
    implements _$$DataProfileImplCopyWith<$Res> {
  __$$DataProfileImplCopyWithImpl(
      _$DataProfileImpl _value, $Res Function(_$DataProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? image = freezed,
    Object? gender = freezed,
    Object? date = freezed,
    Object? heroscope = freezed,
    Object? zodiac = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? interest = freezed,
  }) {
    return _then(_$DataProfileImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      interest: freezed == interest
          ? _value._interest
          : interest // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataProfileImpl implements _DataProfile {
  const _$DataProfileImpl(
      {this.userId,
      this.displayName,
      this.image,
      this.gender,
      this.date,
      this.heroscope,
      this.zodiac,
      this.height,
      this.weight,
      final List<String>? interest})
      : _interest = interest;

  factory _$DataProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataProfileImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? displayName;
  @override
  final String? image;
  @override
  final String? gender;
  @override
  final String? date;
  @override
  final String? heroscope;
  @override
  final String? zodiac;
  @override
  final int? height;
  @override
  final int? weight;
  final List<String>? _interest;
  @override
  List<String>? get interest {
    final value = _interest;
    if (value == null) return null;
    if (_interest is EqualUnmodifiableListView) return _interest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataProfile(userId: $userId, displayName: $displayName, image: $image, gender: $gender, date: $date, heroscope: $heroscope, zodiac: $zodiac, height: $height, weight: $weight, interest: $interest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heroscope, heroscope) ||
                other.heroscope == heroscope) &&
            (identical(other.zodiac, zodiac) || other.zodiac == zodiac) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._interest, _interest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      displayName,
      image,
      gender,
      date,
      heroscope,
      zodiac,
      height,
      weight,
      const DeepCollectionEquality().hash(_interest));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataProfileImplCopyWith<_$DataProfileImpl> get copyWith =>
      __$$DataProfileImplCopyWithImpl<_$DataProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataProfileImplToJson(
      this,
    );
  }
}

abstract class _DataProfile implements DataProfile {
  const factory _DataProfile(
      {final String? userId,
      final String? displayName,
      final String? image,
      final String? gender,
      final String? date,
      final String? heroscope,
      final String? zodiac,
      final int? height,
      final int? weight,
      final List<String>? interest}) = _$DataProfileImpl;

  factory _DataProfile.fromJson(Map<String, dynamic> json) =
      _$DataProfileImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get displayName;
  @override
  String? get image;
  @override
  String? get gender;
  @override
  String? get date;
  @override
  String? get heroscope;
  @override
  String? get zodiac;
  @override
  int? get height;
  @override
  int? get weight;
  @override
  List<String>? get interest;
  @override
  @JsonKey(ignore: true)
  _$$DataProfileImplCopyWith<_$DataProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
