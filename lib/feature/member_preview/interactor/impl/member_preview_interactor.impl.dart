// Saturday, 21st May 2022 01:07 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/model/model_table/user_info_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../member_preview_interactor.dart';
import '../member_preview_repository.dart';

class MemberPreviewInteractorImpl extends MemberPreviewInteractor {
  final MemberPreviewRepository repository;
  MemberPreviewInteractorImpl({
    required this.repository,
  });

  @override
  Stream<DatabaseEvent> stream(String path) {
    return repository.stream(path);
  }

  @override
  Future<UserInfoModel?> getInfo(String uid) async {
    return repository.getInfo(uid);
  }
}
