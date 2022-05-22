// Saturday, 21st May 2022 04:32 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

import '../interactor/home_interactor.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeInteractor interactor;

  HomeBloc({required this.interactor}) : super(HomeInitial()) {
    on<HomeGetListUserInfoEvent>(_onHomeGetListUserInfoEvent);
  }

  void _onHomeGetListUserInfoEvent(
    HomeGetListUserInfoEvent event,
    Emitter<HomeState> emit,
  ) async {
    await interactor.setOnlineStatus(event.model);
    final list = await interactor.getUsersInfoModel();
    list.removeWhere((e) => e.id == event.model.id);
    emit(HomeGetListSuccess(list: list));
  }
}
