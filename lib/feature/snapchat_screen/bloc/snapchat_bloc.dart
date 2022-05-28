// Saturday, 21st May 2022 10:33 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../interactor/snapchat_interactor.dart';
import '../model/snapchat_argument.dart';

part 'snapchat_event.dart';
part 'snapchat_state.dart';

class SnapchatBloc extends Bloc<SnapchatEvent, SnapchatState> {
  final ItemScrollController scrollToIndexController = ItemScrollController();
  final SnapchatInteractor interactor;
  SnapchatBloc({required this.interactor}) : super(SnapchatInitial()) {
    on<SnapchatCheckConversation>(_onSnapchatCheckConversation);
    on<SnapchatChatingEvent>(_onSnapchatChatingEvent);
  }

  void _onSnapchatCheckConversation(
    SnapchatCheckConversation event,
    Emitter<SnapchatState> emit,
  ) async {
    try {
      final arg = event.argument;
      if (arg is ArgumentByMember) {
        final groupChat = await interactor.findGroupChatByMembers([
          arg.myInfo.id,
          arg.memberInfo.id,
        ]);
        if (groupChat == null) {
          emit(SnapchatEmptyState());
          return;
        }
        _snapchatStarting(groupChat.id, argument: arg, groupChat: groupChat);
      } else if (arg is ArgumentByGroup) {
        _snapchatStarting(arg.groupChatId, argument: arg);
      }
    } catch (e) {
      log(e.toString(), name: 'SnapchatBloc Error');
    }
  }

  void _onSnapchatChatingEvent(
    SnapchatChatingEvent event,
    Emitter<SnapchatState> emit,
  ) {
    emit(SnapchatChatingState(messages: event.messages, members: event.members));
  }

  Future<void> _snapchatStarting(
    String groupChatId, {
    required SnapchatArgument argument,
    GroupChatInfo? groupChat,
  }) async {
    groupChat ??= await interactor.findGroupChatById(groupChatId);

    if (groupChat == null) throw Exception();
    var members = <MemberGroupInfo>[];
    for (var memberId in groupChat.membersId) {
      final userInfo = await interactor.findUserInfoById(memberId);
      final userGroup = await interactor.findUserGroupById(memberId);
      if (userInfo == null || userGroup == null) continue;
      members.add(MemberGroupInfo.fromModel(userGroup, userInfo));
    }

    final myGroup = members.firstWhere((e) => e.id == argument.myInfo.id);

    interactor.listener(groupChatId, myGroup.toUserGroupModel(), (snap) {
      add(SnapchatChatingEvent(messages: snap, members: members));
    });
  }
}
