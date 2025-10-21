import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.laptopRepo) : super(GetCartInitial());
  final LaptopRepo laptopRepo;

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await laptopRepo.getCart();
    result.fold(
      (l) => emit(GetCartFailure(errorMessage: l.errorMessage)),
      (cart) => emit(GetCartSuccess(cartList: cart)),
    );
  }
}
