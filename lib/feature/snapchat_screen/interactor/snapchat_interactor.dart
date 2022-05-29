// Saturday, 21st May 2022 10:11 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../model/sent_message.dart';

abstract class SnapchatInteractor {
  void listener(
    String groupChatId,
    UserGroupModel myGroup,
    Function(List<MessageInfo> snap) listener,
  );

  Future<void> addMessage(SentMessage message, GroupChatInfo groupChat);
  Future<void> updateMessage(MessageInfo message, String groupChatId);
  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId);
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId);
  Future<GroupChatInfo?> findGroupChatById(String groupChatId);
  Future<UserInfoModel?> findUserInfoById(String uid);
  Future<UserGroupModel?> findUserGroupByUserIdAndGroupChatId(
    String userId,
    String groupChatId,
  );
  Future<GroupChatInfo> initConversation(
    SentMessage sentMessage,
    List<String> membersId,
  );

  void removeListen();
}
