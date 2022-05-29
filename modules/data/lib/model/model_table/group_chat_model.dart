// Saturday, 14th May 2022 07:58 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

import '../../data.dart';

part 'group_chat_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class GroupChatInfo extends DocumentModel {
  @JsonKey(name: 'name_group')
  final String? name;
  final String ownerId;
  final int type;
  final int createdAt;
  final int updatedAt;
  final String lastMessageId;
  final List<String> membersId;

  GroupChatInfo({
    required super.id,
    super.reference,
    this.name,
    required this.ownerId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessageId,
    required this.membersId,
  });

  factory GroupChatInfo.fromJson(Map<String, dynamic> json) => _$GroupChatInfoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$GroupChatInfoToJson(this);

  GroupChatInfo copyWith({
    String? id,
    Object? reference,
    String? name,
    String? ownerId,
    int? type,
    int? createdAt,
    int? updatedAt,
    String? lastMessageId,
    List<String>? membersId,
  }) {
    return GroupChatInfo(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastMessageId: lastMessageId ?? this.lastMessageId,
      membersId: membersId ?? this.membersId,
    );
  }
}
