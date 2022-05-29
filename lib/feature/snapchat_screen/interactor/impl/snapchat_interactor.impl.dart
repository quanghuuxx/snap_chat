// Sunday, 15th May 2022 04:41 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.


import 'package:core/core.dart';
import 'package:data/data.dart';

import '../../model/sent_message.dart';
import '../snapchat_interactor.dart';
import '../snapchat_repository.dart';

class SnapchatInteractorIml extends SnapchatInteractor {
  final SnapchatRepository repository;
  SnapchatInteractorIml({
    required this.repository,
  });

  @override
  void listener(
    String groupChatId,
    UserGroupModel myGroup,
    Function(List<MessageInfo> snap) listener,
  ) {
    return repository.listener(groupChatId, myGroup, listener);
  }

  @override
  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId) {
    return repository.findGroupChatByMembers(membersId);
  }

  @override
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId) {
    return repository.getMembersGroupInfo(groupChatId);
  }

  @override
  Future<UserInfoModel?> findUserInfoById(String uid) {
    return repository.findUserInfoById(uid);
  }

  @override
  Future<GroupChatInfo?> findGroupChatById(String groupChatId) {
    return repository.findGroupChatById(groupChatId);
  }

  @override
  Future<GroupChatInfo> initConversation(
    SentMessage sentMessage,
    List<String> membersId,
  ) async {
    var group = GroupChatInfo(
      id: '',
      ownerId: sentMessage.senderId,
      type: 0,
      createdAt: Helpers.timestamp,
      updatedAt: Helpers.timestamp,
      lastMessageId: '',
      membersId: membersId,
    );

    final groupId = await repository.createGroupChat(group);

    group = group.copyWith(id: groupId);
    for (var member in membersId) {
      await repository.createUserGroup(
        UserGroupModel(
          id: '',
          userId: member,
          joinedAt: Helpers.timestamp,
          groupChatId: groupId,
          isNotification: true,
        ),
      );
    }

    await addMessage(sentMessage, group);
    return group;
  }

  @override
  Future<void> addMessage(SentMessage message, GroupChatInfo groupChat) async {
    final messageInfo = MessageInfo(
      id: '',
      senderId: message.senderId,
      sentAt: Helpers.timestamp,
      content: message.text!,
      contentType: MessageContentType.text.name,
      type: MessageType.user_sent.index,
    );

    final messId = await repository.addMessage(messageInfo, groupChat.id);

    await repository.updateGroupChat(groupChat.copyWith(lastMessageId: messId));
  }

  @override
  Future<void> updateMessage(MessageInfo message, String groupChatId) {
    return repository.updateMessage(message, groupChatId);
  }

  @override
  Future<UserGroupModel?> findUserGroupByUserIdAndGroupChatId(
    String userId,
    String groupChatId,
  ) {
    return repository.findUserInfoByUserIdAndGroupChatId(userId, groupChatId);
  }

  @override
  void removeListen() {
    return repository.removeListen();
  }
}
