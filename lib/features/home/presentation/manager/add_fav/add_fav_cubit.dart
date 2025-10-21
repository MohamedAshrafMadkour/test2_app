import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'add_fav_state.dart';

class AddFavCubit extends Cubit<AddFavState> {
  AddFavCubit(this.laptopRepo) : super(AddFavInitial());
  final LaptopRepo laptopRepo;

  void addFav({required String id}) async {
    emit(AddFavLoading());
    final result = await laptopRepo.postFav(id: id);
    result.fold(
      (failure) => emit(AddFavFailure(errorMessage: failure.errorMessage)),
      (data) => emit(AddFavAdd(message: data['message'])),
    );
  }
}
