import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.laptopRepo) : super(CartInitial());
  final LaptopRepo laptopRepo;

  Future<void> addToCart({required IdModel idModel}) async {
    emit(CartLoading());
    final result = await laptopRepo.postCart(idModel: idModel);
    result.fold(
      (failure) => emit(CartFailure(errorMessage: failure.errorMessage)),
      (data) => emit(CartSuccess(message: data['message'])),
    );
  }
}
