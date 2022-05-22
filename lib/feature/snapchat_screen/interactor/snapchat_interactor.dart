// Saturday, 21st May 2022 10:11 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class SnapchatInteractor {
  void listener(String groupChatId, UserGroupModel myGroup, Function(List<DocumentModel<MessageInfo>> snap) listener);

  Future<void> addMessage(DocumentModel<MessageInfo> message);
  Future<void> updateMessage(DocumentModel<MessageInfo> message);
  Future<DocumentModel<GroupChatInfo>?> findGroupChatByMembers(List<String> membersId);
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId);
  Future<DocumentModel<GroupChatInfo>?> findGroupChatById(String groupChatId);
  Future<UserInfoModel?> findUserInfoById(String uid);
  Future<DocumentModel<UserGroupModel>?> findUserGroupById(String uid);
}
