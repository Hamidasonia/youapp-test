import 'updateProfile.welltested_test.mocks.dart';import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/home/home.dart';
import 'package:youapp_test/features/home/domain/repositories/home_repositories.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
  });

  group('updateProfile', () {
    const name = 'testname';
    const birthday = '1990-01-01';
    const height = 180;
    const weight = 70;
    const interests = ['Reading', 'Traveling'];

    test('should return Right(User) when updateProfile is successful', () async {
      final user = User(
        email: 'test@example.com',
        username: 'testusername',
        name: name,
        birthday: birthday,
        height: height,
        weight: weight,
        interests: interests,
      );
      when(mockHomeRepository.updateProfile(
              name: name, birthday: birthday, height: height, weight: weight, interests: interests))
          .thenAnswer((_) async => Right(user));

      final result = await mockHomeRepository.updateProfile(
          name: name, birthday: birthday, height: height, weight: weight, interests: interests);

      expect(result, equals(Right(user)));
      verify(mockHomeRepository.updateProfile(
              name: name, birthday: birthday, height: height, weight: weight, interests: interests))
          .called(1);
    });

    test('should return Left(Failure) when updateProfile fails', () async {
      const failure = Failure(message: 'Update profile failed');
      when(mockHomeRepository.updateProfile(
              name: name, birthday: birthday, height: height, weight: weight, interests: interests))
          .thenAnswer((_) async => Left(failure));

      final result = await mockHomeRepository.updateProfile(
          name: name, birthday: birthday, height: height, weight: weight, interests: interests);

      expect(result, equals(Left(failure)));
      verify(mockHomeRepository.updateProfile(
              name: name, birthday: birthday, height: height, weight: weight, interests: interests))
          .called(1);
    });
  });
}