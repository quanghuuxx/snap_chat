// Saturday, 21st May 2022 03:55 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class HomeInteractor {
  Future<void> setOnlineStatus(UserInfoModel model);
  Future<List<UserInfoModel>> getUsersInfoModel();
}
