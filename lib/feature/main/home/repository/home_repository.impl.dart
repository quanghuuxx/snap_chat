// Saturday, 21st May 2022 04:03 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../interactor/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final UserInfoRealtimeDAO userInfoDAO;
  HomeRepositoryImpl({
    required this.userInfoDAO,
  });

  @override
  Future<void> setOnlineStatus(UserInfoModel model) async {
    await userInfoDAO.update(model.id, model.toJson(), putIfAbsent: true);
    return userInfoDAO.configPresenceUser(model.id, model.toJson());
  }

  @override
  Future<List<UserInfoModel>> getUsersInfoModel() async {
    final response = await userInfoDAO.ref.get();
    final list = <UserInfoModel>[];
    for (var e in response.children) {
      if (e.exists) {
        list.add(UserInfoModel.fromJson(e.value! as Map));
      }
    }
    return list;
  }
}
