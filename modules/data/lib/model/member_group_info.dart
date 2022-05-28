// Sunday, 15th May 2022 04:56 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

import '../data.dart';

part 'member_group_info.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class MemberGroupInfo {
  final String id;
  final String name;
  final String userGroupId;
  final String? photoUrl;
  final int joinedAt;
  final int? deletedAt;
  final int? seenAt;
  final bool isNotification;
  final String groupChatId;

  MemberGroupInfo({
    required this.id,
    required this.name,
    required this.userGroupId,
    this.photoUrl,
    required this.joinedAt,
    required this.groupChatId,
    this.deletedAt,
    this.seenAt,
    required this.isNotification,
  });

  factory MemberGroupInfo.fromModel(UserGroupModel userGroup, UserInfoModel info) {
    return MemberGroupInfo(
      id: info.id,
      name: info.name,
      userGroupId: userGroup.id,
      photoUrl: info.photoUrl,
      joinedAt: userGroup.joinedAt,
      deletedAt: userGroup.deletedAt,
      seenAt: userGroup.seenAt,
      isNotification: userGroup.isNotification,
      groupChatId: userGroup.groupChatId,
    );
  }

  UserGroupModel toUserGroupModel() {
    return UserGroupModel(
      id: userGroupId,
      userId: id,
      joinedAt: joinedAt,
      groupChatId: groupChatId,
      isNotification: isNotification,
      deletedAt: deletedAt,
      seenAt: seenAt,
    );
  }

  UserInfoModel toUserInfoModel() {
    return UserInfoModel(
      id: id,
      name: name,
      lastUseDeviceId: '',
      photoUrl: photoUrl,
    );
  }

  factory MemberGroupInfo.fromJson(Map<String, dynamic> json) => _$MemberGroupInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MemberGroupInfoToJson(this);
}
