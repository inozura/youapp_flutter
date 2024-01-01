import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    bool? success,
    String? email,
    String? error,
  }) = _RegisterResponse;

  const RegisterResponse._();

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Register toEntity() => Register(success: success, email: email);
}
