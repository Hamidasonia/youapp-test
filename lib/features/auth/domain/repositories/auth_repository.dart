import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login({
    required String email,
    required String username,
    required String password,
  });

  Future<Either<Failure, Register>> register({
    required String email,
    required String username,
    required String password,
  });

  Future<Either<Failure, bool>> logout();
}
