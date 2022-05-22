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
  final List<DocumentModel<MessageInfo>> messages;
  final List<MemberGroupInfo> members;
  SnapchatChatingEvent({
    required this.messages,
    required this.members,
  });
}
