// Saturday, 21st May 2022 04:02 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../home_interactor.dart';
import '../home_repository.dart';

class HomeInteractorImpl extends HomeInteractor {
  final HomeRepository repository;
  HomeInteractorImpl({
    required this.repository,
  });

  @override
  Future<void> setOnlineStatus(UserInfoModel model) {
    return repository.setOnlineStatus(model);
  }

  @override
  Future<List<UserInfoModel>> getUsersInfoModel() {
    return repository.getUsersInfoModel();
  }
}
