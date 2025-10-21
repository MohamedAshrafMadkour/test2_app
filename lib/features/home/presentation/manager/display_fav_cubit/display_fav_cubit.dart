import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'display_fav_state.dart';

class DisplayFavCubit extends Cubit<DisplayFavState> {
  DisplayFavCubit(this.laptopRepo) : super(DisplayFavInitial());
  final LaptopRepo laptopRepo;

  Future<void> getFav() async {
    emit(DisplayFavLoading());
    final result = await laptopRepo.getFav();
    result.fold(
      (failure) => emit(DisplayFavFailure(errorMessage: failure.errorMessage)),
      (data) => emit(DisplayFavSuccess(productsList: data)),
    );
  }
}
