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
  Future<UserInfoModel?> findUserInfoById(String uid) {
    return userInfoRDB.findByPath(uid);
  }

  @override
  Future<GroupChatInfo?> findGroupChatById(String groupChatId) {
    return groupChatCollection.findGroupChatById(groupChatId);
  }

  @override
  Future<String> addMessage(MessageInfo message, String groupChatId) async {
    final ref = await MessageCollection.of(groupChatId).add(message);
    return ref.id;
  }

  @override
  Future<String> createGroupChat(GroupChatInfo groupChatInfo) async {
    final ref = await groupChatCollection.add(groupChatInfo);
    return ref.id;
  }

  @override
  Future<String> createUserGroup(UserGroupModel userGroupModel) async {
    final ref = await userGroupCollection.add(userGroupModel);
    return ref.id;
  }

  @override
  Future<void> updateGroupChat(GroupChatInfo groupChat) {
    return groupChatCollection.update(groupChat);
  }

  @override
  Future<void> updateMessage(MessageInfo message, String groupChatId) {
    return MessageCollection.of(groupChatId).update(message);
  }

  @override
  Future<UserGroupModel?> findUserInfoByUserIdAndGroupChatId(
    String userId,
    String groupChatId,
  ) {
    return userGroupCollection.findUserGroupByUserIdAndGroupChat(
      userId,
      groupChatId,
    );
  }

  @override
  void removeListen() {
    MessageCollection.of('').removeListen();
  }
}
