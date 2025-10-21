part of 'delete_fav_cubit.dart';

sealed class DeleteFavState extends Equatable {
  const DeleteFavState();

  @override
  List<Object> get props => [];
}

final class DeleteFavInitial extends DeleteFavState {}

final class DeleteFavLoading extends DeleteFavState {}

final class DeleteFavFailure extends DeleteFavState {
  final String errorMessage;
  const DeleteFavFailure({required this.errorMessage});
}

final class DeleteFavSuccess extends DeleteFavState {
  final String message;
  const DeleteFavSuccess({required this.message});
}
