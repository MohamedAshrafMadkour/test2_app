import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/auth/login/data/login_repo/login_repo.dart';
import 'package:test2_app/features/auth/login/data/model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  Future<void> login({required UserModel userModel}) async {
    emit(LoginLoading());
    final result = await loginRepo.login(userModel: userModel);
    result.fold(
      (l) => emit(LoginFailure(errorMessage: l.errorMessage)),
      (data) => emit(LoginSuccess(message: data)),
    );
  }
}
