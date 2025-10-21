import 'package:dartz/dartz.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/features/auth/register/data/model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, Map<String, dynamic>>> register({
    required RegisterModel registerModel,
  });
}
