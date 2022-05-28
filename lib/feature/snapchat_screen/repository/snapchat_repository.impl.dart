// Saturday, 21st May 2022 10:48 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../interactor/snapchat_repository.dart';

class SnapchatRepositoryImpl extends SnapchatRepository {
  final UserGroupCollection userGroupCollection;
  final GroupChatCollection groupChatCollection;
  final UserInfoRealtimeDAO userInfoRDB;
  SnapchatRepositoryImpl({
    required this.userGroupCollection,
    required this.userInfoRDB,
    required this.groupChatCollection,
  });

  @override
  Future<void> addMessage(MessageInfo message) {
    return MessageCollection.of('').add(message);
  }

  @override
  Future<void> updateMessage(MessageInfo message) {
    return MessageCollection.of('').update(message);
  }

  @override
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId) async {
    return [];
  }

  @override
  void listener(
    String groupChatId,
    UserGroupModel myGroup,
    Function(List<MessageInfo> snap) listener,
  ) {
    MessageCollection.of(groupChatId).listen(
      listen: listener,
      userGroup: myGroup,
    );
  }

  @override
  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId) async {
    return groupChatCollection.findGroupChatByMembers(membersId);
  }

  @override
  Future<UserGroupModel?> findUserGroupById(String uid) {
    return userGroupCollection.findUserGroupById(uid);
  }

  @override
  Future<UserInfoModel?> findUserInfoById(String uid) {
    return userInfoRDB.findByPath(uid);
  }

  @override
  Future<GroupChatInfo?> findGroupChatById(String groupChatId) {
    return groupChatCollection.findGroupChatById(groupChatId);
  }
}
