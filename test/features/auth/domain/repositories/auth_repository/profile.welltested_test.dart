import 'profile.welltested_test.mocks.dart';import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/core/failures/base.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/core/failures/failures.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:youapp_test/features/home/domain/entities/user.dart';
import 'package:youapp_test/features/home/domain/domain.dart';
import 'package:youapp_test/features/home/domain/entities/entities.dart';
import 'package:youapp_test/features/home/home.dart';

import 'profile.welltested_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('profile', () {
    test('should return Right(user) when profile retrieval is successful', () async {
      final user = User(
        email: 'test@example.com',
        username: 'testuser',
        name: 'Test User',
        birthday: '1990-01-01',
        horoscope: 'Capricorn',
        zodiac: 'Rat',
        height: 180,
        weight: 70,
        interests: ['Reading', 'Coding'],
      );
      when(mockAuthRepository.profile()).thenAnswer((_) async => Right(user));

      final result = await mockAuthRepository.profile();

      expect(result, equals(Right<Failure, User>(user)));
      verify(mockAuthRepository.profile()).called(1);
    });

    test('should return Left(Failure) when profile retrieval fails', () async {
      final failure = Failure(message: 'Failed to retrieve profile');
      when(mockAuthRepository.profile()).thenAnswer((_) async => Left(failure));

      final result = await mockAuthRepository.profile();

      expect(result, equals(Left<Failure, User>(failure)));
      verify(mockAuthRepository.profile()).called(1);
    });
  });
}