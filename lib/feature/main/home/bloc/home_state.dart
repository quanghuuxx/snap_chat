// Saturday, 21st May 2022 04:32 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeGetListSuccess extends HomeState {
  final List<UserInfoModel> list;
  const HomeGetListSuccess({
    required this.list,
  });

}
