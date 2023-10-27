// Mocks generated by Mockito 5.4.2 from annotations
// in youapp_test/test/features/auth/domain/repositories/auth_repository/profile.welltested_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:youapp_test/core/core.dart' as _i5;
import 'package:youapp_test/features/auth/auth.dart' as _i3;
import 'package:youapp_test/features/home/home.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.Login>> login({
    required String? email,
    required String? username,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [],
          {
            #email: email,
            #username: username,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i3.Login>>.value(
            _FakeEither_0<_i5.Failure, _i3.Login>(
          this,
          Invocation.method(
            #login,
            [],
            {
              #email: email,
              #username: username,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.Login>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i3.Register>> register({
    required String? email,
    required String? username,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #email: email,
            #username: username,
            #password: password,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i3.Register>>.value(
            _FakeEither_0<_i5.Failure, _i3.Register>(
          this,
          Invocation.method(
            #register,
            [],
            {
              #email: email,
              #username: username,
              #password: password,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i3.Register>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #logout,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.User>> profile() =>
      (super.noSuchMethod(
        Invocation.method(
          #profile,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.User>>.value(
            _FakeEither_0<_i5.Failure, _i6.User>(
          this,
          Invocation.method(
            #profile,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.User>>);
}
