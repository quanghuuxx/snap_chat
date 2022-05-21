//* Sunday, 15th May 2022 11:17 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final DocumentModel<MessageInfo> message;
  final bool hasMess;
  final bool isMyMess;
  const MessageCard({
    super.key,
    required this.message,
    required this.hasMess,
    required this.isMyMess,
  });

  bool get hasParent => message.data.parentId != null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (hasParent) _parentMessage(),
        Positioned(
          bottom: hasParent ? 30 : 0,
          child: (isMyMess) ? _myMessage() : _peerMessage(),
        )
      ],
    );
  }

  Widget _peerMessage() {
    return Row(
      children: [
        if (hasMess)
          const CircleAvatar(maxRadius: 30)
        else
          const SizedBox(width: 30),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: Text(
              message.data.content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _myMessage() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      ),
      child: Text(
        message.data.content,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _parentMessage() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueAccent,
      ),
      child: Text(
        message.data.content,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
