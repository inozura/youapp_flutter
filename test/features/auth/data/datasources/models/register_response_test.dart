import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:youapp_test/features/auth/data/models/register_response.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  const registerResponse =
      RegisterResponse(success: true, email: 'email@mail.com');

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(successRegisterPath));

    /// act
    final result = RegisterResponse.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(registerResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = registerResponse.toJson();

    /// arrange
    final exceptedJson = {
      "id": 4,
      "token": 'QpwL5tke4Pnpja7X4',
      'error': null,
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
