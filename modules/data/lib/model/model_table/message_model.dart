// Sunday, 15th May 2022 08:40 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class MessageInfo {
  final String senderId;
  final int sentAt;
  final String content;
  final String contentType;
  final int? recallAt;
  final List<String>? hideWith;
  final String? parentId;
  final int type;

  MessageInfo({
    required this.senderId,
    required this.sentAt,
    required this.content,
    required this.contentType,
    this.recallAt,
    this.hideWith,
    this.parentId,
    required this.type,
  });

  factory MessageInfo.fromJson(Map<String, dynamic> json) => _$MessageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);
}
