import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/core.dart';
import 'package:youapp_test/features/home/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, User>> updateProfile({
    required String name,
    String? birthday,
    int? height,
    int? weight,
    List<String>? interests,
  });
}
