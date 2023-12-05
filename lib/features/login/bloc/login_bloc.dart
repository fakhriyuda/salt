import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salt_test/features/login/data/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginGo>((event, emit) async {
      try {
        emit(LoginLoading());
        var result = await LoginRepository().login(event.email, event.password);
        if (result != null) {
          emit(LoginSuccess());          
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
