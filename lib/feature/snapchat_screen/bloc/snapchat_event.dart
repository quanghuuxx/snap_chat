// Sunday, 15th May 2022 10:55 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'snapchat_bloc.dart';

@immutable
abstract class SnapchatEvent {}

class SnapchatCheckConversation extends SnapchatEvent {
  final SnapchatArgument argument;
  SnapchatCheckConversation({
    required this.argument,
  });
}

class SnapchatChatingEvent extends SnapchatEvent {
  final List<MessageInfo> messages;
  final List<MemberGroupInfo> members;
  final GroupChatInfo groupChatInfo;
  SnapchatChatingEvent({
    required this.messages,
    required this.members,
    required this.groupChatInfo,
  });
}

class InitConversationEvent extends SnapchatEvent {
  final SentMessage sentMessage;
  final List<String> membersId;
  final SnapchatArgument argument;

  InitConversationEvent({
    required this.sentMessage,
    required this.membersId,
    required this.argument,
  });
}

class SendMessageEvent extends SnapchatEvent {
  final SentMessage sentMessage;
  SendMessageEvent({
    required this.sentMessage,
  });
}
