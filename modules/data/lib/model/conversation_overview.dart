// Saturday, 21st May 2022 05:37 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'conversation_overview.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class ConversationOverview {
  final String id;
  final String? name;
  final String ownerId;
  final int type;
  final MessageInfo lastMessage;
  final int createdAt;
  final int updatedAt;
  final UserInfoModel peerInfo;

  ConversationOverview({
    required this.id,
    this.name,
    required this.ownerId,
    required this.type,
    required this.lastMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.peerInfo,
  });


  factory ConversationOverview.fromJson(Map<String, dynamic> json) =>
      _$ConversationOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationOverviewToJson(this);

  ConversationOverview copyWith({
    String? id,
    String? name,
    String? ownerId,
    int? type,
    MessageInfo? lastMessage,
    int? createdAt,
    int? updatedAt,
    UserInfoModel? peerInfo,
  }) {
    return ConversationOverview(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      type: type ?? this.type,
      lastMessage: lastMessage ?? this.lastMessage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      peerInfo: peerInfo ?? this.peerInfo,
    );
  }
}
