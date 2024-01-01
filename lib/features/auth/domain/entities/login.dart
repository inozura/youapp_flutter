import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({bool? success, String? token}) = _Login;
}
