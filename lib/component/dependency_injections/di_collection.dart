// Saturday, 21st May 2022 03:12 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of './di.dart';



void _injectorCollection() {
  injector
    ..registerFactory<UserGroupCollection>(() => UserGroupCollection())
    ..registerFactory<MessageCollection>(() => MessageCollection(groupChatId: ''))
    ..registerFactory<GroupChatCollection>(() => GroupChatCollection());
}
