// Sunday, 15th May 2022 04:36 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class SnapchatRepository {
  void listener(
    String groupChatId,
    UserGroupModel myGroup,
    Function(List<MessageInfo> snap) listener,
  );

  Future<void> addMessage(MessageInfo message);
  Future<void> updateMessage(MessageInfo message);
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId);
  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId);
  Future<GroupChatInfo?> findGroupChatById(String groupChatId);
  Future<UserInfoModel?> findUserInfoById(String uid);
  Future<UserGroupModel?> findUserGroupById(String uid);
}
