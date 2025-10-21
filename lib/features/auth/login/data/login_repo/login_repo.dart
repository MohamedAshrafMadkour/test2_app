import 'package:dartz/dartz.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/features/auth/login/data/model/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required UserModel userModel,
  });
}
