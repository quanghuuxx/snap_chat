// Sunday, 15th May 2022 11:17 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final MessageInfo message;
  final bool showReceiverAvatar;
  final bool isMineSend;
  const MessageCard({
    super.key,
    required this.message,
    required this.showReceiverAvatar,
    required this.isMineSend,
  });

  bool get hasParent => message.parentId != null;

  @override
  Widget build(BuildContext context) {
    return (isMineSend) ? _myMessage() : _peerMessage();
  }

  Widget _peerMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showReceiverAvatar)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(maxRadius: 12),
          )
        else
          const SizedBox(width: 42),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey,
            ),
            child: Text(
              message.content,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 42, top: 5, bottom: 5, right: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: Text(
          message.content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
