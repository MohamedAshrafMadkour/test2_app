import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/profile_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.laptopRepo) : super(ProfileInitial());
  final LaptopRepo laptopRepo;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final res = await laptopRepo.getProfile();
    res.fold(
      (l) => emit(ProfileFailure(errorMessage: l.errorMessage)),
      (r) => emit(ProfileSuccess(profileModel: r)),
    );
  }
}
