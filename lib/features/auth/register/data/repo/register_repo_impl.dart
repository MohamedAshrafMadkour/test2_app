import 'package:dartz/dartz.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/core/service/api_service.dart';
import 'package:test2_app/features/auth/register/data/model/register_model.dart';
import 'package:test2_app/features/auth/register/data/repo/register_repo.dart';

class RegisterRepoImpl extends RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, Map<String, dynamic>>> register({
    required RegisterModel registerModel,
  }) async {
    try {
      final response = await apiService.post(
        data: registerModel.toJson(),
        url: 'https://elwekala.onrender.com/user/register',
      );
      return right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
