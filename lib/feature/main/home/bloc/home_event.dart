// Saturday, 21st May 2022 04:34 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetListUserInfoEvent extends HomeEvent {
  final UserInfoModel model;
  const HomeGetListUserInfoEvent({
    required this.model,
  });
}
