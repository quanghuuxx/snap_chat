// Sunday, 15th May 2022 12:36 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'snapchat_bloc.dart';

@immutable
abstract class SnapchatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SnapchatInitial extends SnapchatState {}

class SnapchatChatingState extends SnapchatState {
  final List<MessageInfo> messages;
  final List<MemberGroupInfo> members;
  final GroupChatInfo groupChatInfo;

  SnapchatChatingState({
    required this.messages,
    required this.members,
    required this.groupChatInfo,
  });

  @override
  List<Object?> get props => [
        messages,
      ];
}

class SnapchatEmptyState extends SnapchatState {}
