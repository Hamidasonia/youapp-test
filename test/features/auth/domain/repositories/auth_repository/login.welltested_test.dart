import 'login.welltested_test.mocks.dart';import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/core/failures/base.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/core/failures/failures.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:youapp_test/features/auth/domain/repositories/auth_repository.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('login', () {
    const email = 'test@example.com';
    const username = 'testusername';
    const password = 'testpassword';

    test('should return Right(Login) when login is successful', () async {
      const login = Login(
        message: 'Login successful',
        accessToken: 'access_token',
      );
      when(mockAuthRepository.login(email: email, username: username, password: password))
          .thenAnswer((_) async => Right(login));

      final result = await mockAuthRepository.login(email: email, username: username, password: password);

      expect(result, equals(Right(login)));
      verify(mockAuthRepository.login(email: email, username: username, password: password)).called(1);
    });

    test('should return Left(Failure) when login fails', () async {
      const failure = Failure(
        message: 'Login failed',
        code: '401',
        errorCode: 'invalid_credentials',
      );
      when(mockAuthRepository.login(email: email, username: username, password: password))
          .thenAnswer((_) async => Left(failure));

      final result = await mockAuthRepository.login(email: email, username: username, password: password);

      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.login(email: email, username: username, password: password)).called(1);
    });
  });
}