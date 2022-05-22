// Saturday, 21st May 2022 01:08 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:firebase_database/firebase_database.dart';

import '../interactor/member_preview_repository.dart';

class MemberPreviewRepositoryImpl extends MemberPreviewRepository {
  final UserInfoRealtimeDAO userInfoDAO;
  MemberPreviewRepositoryImpl({
    required this.userInfoDAO,
  });

  @override
  Stream<DatabaseEvent> stream(String path) {
    return userInfoDAO.stream(path);
  }

  @override
  Future<UserInfoModel?> getInfo(String uid) {
    return userInfoDAO.findByPath(uid);
  }
}
