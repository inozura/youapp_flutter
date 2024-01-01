import 'package:flutter/cupertino.dart';
import 'package:mockito/annotations.dart';
import 'package:youapp_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:youapp_test/features/auth/domain/repositories/authentication_repository.dart';

@GenerateMocks([
  AuthRepository,
  AuthRemoteDatasource,
])
@GenerateNiceMocks([MockSpec<BuildContext>()])
void main() {}
