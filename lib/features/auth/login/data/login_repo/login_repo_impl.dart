import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test2_app/core/cached/cached_helper.dart';
import 'package:test2_app/core/constants/keys.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/core/service/api_service.dart';
import 'package:test2_app/features/auth/login/data/login_repo/login_repo.dart';
import 'package:test2_app/features/auth/login/data/model/user_model.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiService apiService;

  LoginRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required UserModel userModel,
  }) async {
    try {
      final response = await apiService.post(
        data: userModel.toJson(),
        url: 'https://elwekala.onrender.com/user/login',
      );
      CachedHelper.saveData(key: Keys.token, value: response['user']['token']);
      CachedHelper.saveData(
        key: Keys.nationalId,
        value: response['user']['nationalId'],
      );
      log(response['user']['token']);
      return right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
