part of 'get_cart_cubit.dart';

sealed class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object> get props => [];
}

final class GetCartInitial extends GetCartState {}

final class GetCartLoading extends GetCartState {}

final class GetCartSuccess extends GetCartState {
  final List<CartModel> cartList;
  const GetCartSuccess({required this.cartList});
  @override
  List<Object> get props => [cartList];
}

final class GetCartFailure extends GetCartState {
  final String errorMessage;
  const GetCartFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
