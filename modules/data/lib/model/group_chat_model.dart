//* Saturday, 14th May 2022 07:58 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'group_chat_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GroupChatInfo {
  @JsonKey(name: 'name_group')
  final String name;
  final String ownerId;
  final int type;
  final int createdAt;
  final int updatedAt;
  final String lastMessageId;

  GroupChatInfo({
    required this.name,
    required this.ownerId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageId,
  });

  factory GroupChatInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupChatInfoFromJson(json);
  Map<String, dynamic> toJson() => _$GroupChatInfoToJson(this);
}
