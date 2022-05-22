// Saturday, 21st May 2022 01:05 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class MemberPreviewInteractor {
  Stream<DatabaseEvent> stream(String path);
  Future<UserInfoModel?> getInfo(String uid);
}
