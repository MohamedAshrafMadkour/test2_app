part of 'laptop_cubit.dart';

sealed class LaptopState extends Equatable {
  const LaptopState();

  @override
  List<Object> get props => [];
}

final class LaptopInitial extends LaptopState {}

final class LaptopLoading extends LaptopState {}

final class LaptopSuccess extends LaptopState {
  final List<LaptopsModel> productsList;
  const LaptopSuccess({required this.productsList});
}

final class LaptopFailure extends LaptopState {
  final String errorMessage;
  const LaptopFailure({required this.errorMessage});
}
