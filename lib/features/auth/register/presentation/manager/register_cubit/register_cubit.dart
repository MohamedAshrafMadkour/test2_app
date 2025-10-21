import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/auth/register/data/model/register_model.dart';
import 'package:test2_app/features/auth/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;

  Future<void> register({required RegisterModel userModel}) async {
    emit(RegisterLoading());
    final result = await registerRepo.register(registerModel: userModel);
    result.fold(
      (l) => emit(RegisterFailure(errorMessage: l.errorMessage)),
      (r) => emit(RegisterSuccess(response: r)),
    );
  }
}
