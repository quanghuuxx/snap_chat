// Sunday, 15th May 2022 08:47 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

import '../../data.dart';

part 'user_group_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UserGroupModel extends DocumentModel {
  final String userId;
  final int joinedAt;
  final int? deletedAt;
  final int? seenAt;
  final String groupChatId;
  final bool isNotification;

  UserGroupModel({
    required super.id,
    super.reference,
    required this.userId,
    required this.joinedAt,
    this.deletedAt,
    this.seenAt,
    required this.groupChatId,
    required this.isNotification,
  });

  factory UserGroupModel.fromJson(Map<String, dynamic> json) => _$UserGroupModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserGroupModelToJson(this);
}
