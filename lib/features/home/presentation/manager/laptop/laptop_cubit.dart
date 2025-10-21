import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'laptop_state.dart';

class LaptopCubit extends Cubit<LaptopState> {
  LaptopCubit(this.homeRepo) : super(LaptopInitial());
  final LaptopRepo homeRepo;

  Future<void> getProductData() async {
    emit(LaptopLoading());
    final result = await homeRepo.getProductData();
    result.fold(
      (l) => emit(LaptopFailure(errorMessage: l.errorMessage)),
      (r) => emit(LaptopSuccess(productsList: r)),
    );
  }
}
