part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartSuccess extends CartState {
  final String message;

  const CartSuccess({required this.message});
}

final class CartFailure extends CartState {
  final String errorMessage;
  const CartFailure({required this.errorMessage});
}

final class CartLoading extends CartState {}
