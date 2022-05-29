// Saturday, 21st May 2022 03:38 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../bloc/snapchat_bloc.dart';
import '../model/sent_message.dart';
import '../model/snapchat_argument.dart';
import 'widget/message_card.dart';
import 'widget/textfield_snapchat.dart';

class SnapchatScreen extends StatefulWidget {
  final SnapchatArgument argument;

  const SnapchatScreen({
    super.key,
    required this.argument,
  });

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends StateBase<SnapchatScreen> {
  SnapchatBloc get snapchatBloc => context.read();

  UserInfoModel get myInfo => widget.argument.myInfo;

  @override
  void onViewCreated() {
    snapchatBloc.add(SnapchatCheckConversation(argument: widget.argument));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<SnapchatBloc, SnapchatState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is SnapchatChatingState) {
                  return ScrollablePositionedList.builder(
                    itemScrollController: snapchatBloc.scrollToIndexController,
                    reverse: true,
                    itemCount: state.messages.length,
                    itemBuilder: (_, index) {
                      final mess = state.messages[index];
                      return MessageCard(
                        message: mess,
                        showReceiverAvatar: showReceiverAvatar(
                          mess,
                          index,
                          state.messages,
                        ),
                        isMineSend: mess.senderId == myInfo.id,
                      );
                    },
                  );
                } else if (state is SnapchatEmptyState) {
                  return const Center(
                    child: Text('Hãy nhắn gì đó để bắt đầu cuộc trò chuyện'),
                  );
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
          TextFieldSnapchat(
            onSend: (text) {
              if (text.isEmpty) return;
              if (snapchatBloc.state is SnapchatEmptyState) {
                snapchatBloc.add(
                  InitConversationEvent(
                    sentMessage: SentMessage(senderId: myInfo.id, text: text),
                    membersId: [
                      myInfo.id,
                      (widget.argument as ArgumentByMember).memberInfo.id,
                    ],
                    argument: widget.argument,
                  ),
                );
              } else {
                snapchatBloc.add(
                  SendMessageEvent(
                    sentMessage: SentMessage(
                      senderId: myInfo.id,
                      text: text,
                    ),
                  ),
                );
              }
            },
            onPickImage: () {},
          ),
        ],
      ),
    );
  }

  bool showReceiverAvatar(
    MessageInfo cur,
    int index,
    List<MessageInfo> list,
  ) {
    if (index == 0) {
      return true;
    } else {
      index--;
    }

    return cur.senderId != list[index].senderId;
  }
}
