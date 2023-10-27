import 'logout.welltested_test.mocks.dart';import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/core/failures/base.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/core/failures/failures.dart';
import 'package:youapp_test/features/auth/domain/repositories/auth_repository.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  group('logout', () {
    test('should return Right(true) when logout is successful', () async {
      when(mockAuthRepository.logout())
          .thenAnswer((_) async => Right(true));

      final result = await mockAuthRepository.logout();

      expect(result, equals(Right(true)));
      verify(mockAuthRepository.logout()).called(1);
    });

    test('should return Left(Failure) when logout fails', () async {
      final failure = Failure(message: 'Logout failed');
      when(mockAuthRepository.logout())
          .thenAnswer((_) async => Left(failure));

      final result = await mockAuthRepository.logout();

      expect(result, equals(Left(failure)));
      verify(mockAuthRepository.logout()).called(1);
    });
  });
}