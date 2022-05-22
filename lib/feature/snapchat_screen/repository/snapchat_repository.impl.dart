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
  Future<void> addMessage(DocumentModel<MessageInfo> message) {
    return MessageCollection.of('').add(message);
  }

  @override
  Future<void> updateMessage(DocumentModel<MessageInfo> message) {
    return MessageCollection.of('').update(message.reference, message.data.toJson());
  }

  @override
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId) async {
    return [];
  }

  @override
  void listener(String groupChatId, UserGroupModel myGroup, Function(List<DocumentModel<MessageInfo>> snap) listener) {
    MessageCollection.of(groupChatId).listen(
      (query) => query.where(MessageCollection.sentAtClm, isGreaterThan: myGroup.deletedAt),
      (snap) => listener,
    );
  }

  @override
  Future<DocumentModel<GroupChatInfo>?> findGroupChatByMembers(List<String> membersId) async {
    final respone = await groupChatCollection.query(
      (query) => query
          .where(GroupChatCollection.membersId, isEqualTo: membersId)
          .where(GroupChatCollection.typeClm, isEqualTo: 0),
    );

    if (respone.isEmpty) {
      return null;
    }
    return respone.first;
  }

  @override
  Future<DocumentModel<UserGroupModel>?> findUserGroupById(String uid) {
    return userGroupCollection.findById(uid);
  }

  @override
  Future<UserInfoModel?> findUserInfoById(String uid) {
    return userInfoRDB.findByPath(uid);
  }

  @override
  Future<DocumentModel<GroupChatInfo>?> findGroupChatById(String groupChatId) {
    return groupChatCollection.findGroupChatInfoById(groupChatId);
  }
}
