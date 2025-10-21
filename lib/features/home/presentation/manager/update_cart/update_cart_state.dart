part of 'update_cart_cubit.dart';

sealed class UpdateCartState extends Equatable {
  const UpdateCartState();

  @override
  List<Object> get props => [];
}

final class UpdateCartInitial extends UpdateCartState {}

final class UpdateCartLoading extends UpdateCartState {}

final class UpdateCartSuccess extends UpdateCartState {}

final class UpdateCartFailure extends UpdateCartState {
  final String errorMessage;
  const UpdateCartFailure({required this.errorMessage});
}
