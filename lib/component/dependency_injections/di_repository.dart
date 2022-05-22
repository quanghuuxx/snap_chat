// Saturday, 21st May 2022 02:56 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'di.dart';

void _injectorRepository() {
  injector
    ..registerFactory<MemberPreviewRepository>(
      () => MemberPreviewRepositoryImpl(
        userInfoDAO: injector.get(),
      ),
    )
    ..registerFactory<SnapchatRepository>(
      () => SnapchatRepositoryImpl(
        groupChatCollection: injector.get(),
        userGroupCollection: injector.get(),
        userInfoRDB: injector.get(),
      ),
    )
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(
        userInfoDAO: injector.get(),
      ),
    );
}
