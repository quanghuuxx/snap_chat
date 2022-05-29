// Saturday, 28th May 2022 08:48 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

class SentMessage {
  final String? text;
  final List<String>? images;
  final String? parentId;
  final String senderId;

  SentMessage({
    this.text,
    this.images,
    this.parentId,
    required this.senderId,
  }) : assert(images != null || text != null);
}
