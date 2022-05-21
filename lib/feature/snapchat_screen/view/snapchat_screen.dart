//* Saturday, 14th May 2022 05:03 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../main/home/view/home_page.dart';
import '../bloc/snapchat_bloc.dart';
import 'widget/message_card.dart';

class SnapchatScreen extends StatefulWidget {
  final UserInfo userInfo;
  final String? groupChatId;
  const SnapchatScreen({
    super.key,
    required this.userInfo,
    this.groupChatId,
  });

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends StateBase<SnapchatScreen> {
  SnapchatBloc get snapchatBloc => context.read();

  @override
  void onViewCreated() {
      snapchatBloc.add(SnapchatCheckConversation(groupChatId: widget.groupChatId));
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SnapchatBloc, SnapchatState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SnapchatChatingState) {
            return ScrollablePositionedList.builder(
              itemScrollController: snapchatBloc.scrollToIndexController,
              reverse: true,
              itemCount: state.messages.length,
              itemBuilder: (_, index) {
                final mess = state.messages[index];
                final lastMess =
                    (index == 0) ? null : state.messages.elementAt(index--);
                return MessageCard(
                  message: mess,
                  hasMess: hasMess(mess.data, lastMess?.data),
                  isMyMess: mess.data.senderId != widget.userInfo.uid,
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
    );
  }

  bool hasMess(MessageInfo cur, MessageInfo? other) {
    if (other == null) return false;
    return cur.senderId == other.senderId;
  }
}
