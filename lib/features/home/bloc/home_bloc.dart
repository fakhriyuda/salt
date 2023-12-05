import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salt_test/features/home/data/model/user.dart';
import 'package:salt_test/features/home/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  List<DataUser> users = [];
  HomeBloc() : super(HomeInitial()) {
    on<GetHome>((event, emit) async {
      try {
        emit(HomeLoading());
        var result = await HomeRepository.getHome();
        if (result.data != null) {
          users = result.data ?? [];
          emit(HomeSuccess());
        }
      } catch (e) {
        emit(HomeFailed(error: e.toString()));
      }
    });
  }
}
