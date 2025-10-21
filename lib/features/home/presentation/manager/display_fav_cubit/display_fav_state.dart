part of 'display_fav_cubit.dart';

sealed class DisplayFavState extends Equatable {
  const DisplayFavState();

  @override
  List<Object> get props => [];
}

final class DisplayFavInitial extends DisplayFavState {}

final class DisplayFavSuccess extends DisplayFavState {
  final List<LaptopsModel> productsList;
  const DisplayFavSuccess({required this.productsList});
}

final class DisplayFavFailure extends DisplayFavState {
  final String errorMessage;
  const DisplayFavFailure({required this.errorMessage});
}

final class DisplayFavLoading extends DisplayFavState {}
