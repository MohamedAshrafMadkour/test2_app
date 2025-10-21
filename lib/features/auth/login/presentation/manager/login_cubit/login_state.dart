part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final Map<String, dynamic> message;

  const LoginSuccess({required this.message});
}

final class LoginFailure extends LoginState {
  final dynamic errorMessage;
  const LoginFailure({required this.errorMessage});
}
