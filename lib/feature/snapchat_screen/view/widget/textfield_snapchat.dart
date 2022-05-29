// Saturday, 28th May 2022 09:20 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:flutter/material.dart';

class TextFieldSnapchat extends StatefulWidget {
  final Function(String text) onSend;
  final Function() onPickImage;

  const TextFieldSnapchat({
    super.key,
    required this.onSend,
    required this.onPickImage,
  });

  @override
  State<TextFieldSnapchat> createState() => _TextFieldSnapchatState();
}

class _TextFieldSnapchatState extends State<TextFieldSnapchat> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_a_photo),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Nhập tin nhắn...',
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            widget.onSend(controller.text.trim());
            controller.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
