//* Sunday, 15th May 2022 04:56 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'member_group_info.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class MemberGroupInfo {
  final String id;
  final String name;
  final String? photoUrl;
  final int joinedAt;
  final int? deletedAt;
  final int? seenAt;
  MemberGroupInfo({
    required this.id,
    required this.name,
    this.photoUrl,
    required this.joinedAt,
    this.deletedAt,
    this.seenAt,
  });

  factory MemberGroupInfo.fromJson(Map<String, dynamic> json) =>
      _$MemberGroupInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MemberGroupInfoToJson(this);
}
