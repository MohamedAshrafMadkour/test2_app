import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this.laptopRepo) : super(UpdateCartInitial());
  final LaptopRepo laptopRepo;

  Future<void> updateCart({required IdModel idModel}) async {
    emit(UpdateCartLoading());
    final result = await laptopRepo.updateCart(idModel: idModel);
    result.fold(
      (l) => emit(UpdateCartFailure(errorMessage: l.errorMessage)),
      (r) => emit(UpdateCartSuccess()),
    );
  }
}
