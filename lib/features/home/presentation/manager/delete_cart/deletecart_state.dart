part of 'deletecart_cubit.dart';

sealed class DeleteCartState extends Equatable {
  const DeleteCartState();

  @override
  List<Object> get props => [];
}

final class DeleteCartInitial extends DeleteCartState {}

final class DeleteCartFailure extends DeleteCartState {
  final String errorMessage;
  const DeleteCartFailure({required this.errorMessage});
}

final class DeleteCartSuccess extends DeleteCartState {}

final class DeleteCartLoading extends DeleteCartState {}
