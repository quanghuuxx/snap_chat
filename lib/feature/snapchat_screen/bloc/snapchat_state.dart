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
  final List<DocumentModel<MessageInfo>> messages;
  final List<MemberGroupInfo> members;
  SnapchatChatingState({
    required this.messages,
    required this.members,
  });

  @override
  List<Object?> get props => [
        messages,
      ];
}

class SnapchatEmptyState extends SnapchatState {}
