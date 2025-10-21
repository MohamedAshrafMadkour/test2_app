import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'delete_fav_state.dart';

class DeleteFavCubit extends Cubit<DeleteFavState> {
  DeleteFavCubit(this.laptopRepo) : super(DeleteFavInitial());
  final LaptopRepo laptopRepo;

  Future<void> deleteFav({required IdModel idModel}) async {
    emit(DeleteFavLoading());
    final result = await laptopRepo.deleteFav(idModel: idModel);
    result.fold(
      (l) => emit(DeleteFavFailure(errorMessage: l.errorMessage)),
      (r) => emit(DeleteFavSuccess(message: r['message'])),
    );
  }
}
