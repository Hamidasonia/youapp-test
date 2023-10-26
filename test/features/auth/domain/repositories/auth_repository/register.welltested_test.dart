import 'register.welltested_test.mocks.dart';import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:youapp_test/features/auth/domain/domain.dart';
import 'package:youapp_test/features/auth/domain/entities/entities.dart';
import 'package:youapp_test/core/failures/base.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/core/failures/failures.dart';
import 'package:youapp_test/features/auth/domain/repositories/auth_repository.dart';

import 'register.welltested_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('register', () {
    const email = 'test@example.com';
    const username = 'testusername';
    const password = 'testpassword';

    test('should return Right(Register) when register is successful', () async {
      const register = Register(message: 'Registration successful');
      when(mockAuthRepository.register(
              email: email, username: username, password: password))
          .thenAnswer((_) async => Right(register));

      final result = await mockAuthRepository.register(
          email: email, username: username, password: password);

      expect(result, equals(Right(register)));
      verify(mockAuthRepository.register(
              email: email, username: username, password: password))
          .called(1);
    });

    test('should return Left(Failure) when register fails', () async {
      const failure = Failure(message: 'Registration failed');
      when(mockAuthRepository.register(
              email: email, username: username, password: password))
          .thenAnswer((_) async => Left(failure));

      final result = await mockAuthRepository.register(
          email: email, username: username, password: password);

      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.register(
              email: email, username: username, password: password))
          .called(1);
    });
  });
}