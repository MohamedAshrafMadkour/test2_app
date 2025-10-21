part of 'add_fav_cubit.dart';

sealed class AddFavState extends Equatable {
  const AddFavState();

  @override
  List<Object> get props => [];
}

final class AddFavInitial extends AddFavState {}

final class AddFavAdd extends AddFavState {
  final String message;

  const AddFavAdd({required this.message});
}

final class AddFavFailure extends AddFavState {
  final String errorMessage;
  const AddFavFailure({required this.errorMessage});
}

final class AddFavLoading extends AddFavState {}
