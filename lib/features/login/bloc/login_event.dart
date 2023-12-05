part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginGo extends LoginEvent{
  final String email;
  final String password;

  LoginGo({required this.email, required this.password});

  
}
