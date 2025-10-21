import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'deletecart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit(this.laptopRepo) : super(DeleteCartInitial());
  final LaptopRepo laptopRepo;

  Future<void> deleteCart({required IdModel idModel}) async {
    emit(DeleteCartLoading());
    final result = await laptopRepo.deleteCart(idModel: idModel);
    result.fold(
      (l) => emit(DeleteCartFailure(errorMessage: l.errorMessage)),
      (r) => emit(DeleteCartSuccess()),
    );
  }
}
