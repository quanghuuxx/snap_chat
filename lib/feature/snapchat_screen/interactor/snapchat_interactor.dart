// Saturday, 21st May 2022 10:11 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class SnapchatInteractor {
  void listener(
    String groupChatId,
    UserGroupModel myGroup,
    Function(List<MessageInfo> snap) listener,
  );

  Future<void> addMessage(MessageInfo message);
  Future<void> updateMessage(MessageInfo message);
  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId);
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId);
  Future<GroupChatInfo?> findGroupChatById(String groupChatId);
  Future<UserInfoModel?> findUserInfoById(String uid);
  Future<UserGroupModel?> findUserGroupById(String uid);
}
