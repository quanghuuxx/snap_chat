//* Saturday, 21st May 2022 10:30 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupModel _$UserGroupModelFromJson(Map<String, dynamic> json) =>
    UserGroupModel(
      userId: json['user_id'] as String,
      joinedAt: json['joined_at'] as int,
      deletedAt: json['deleted_at'] as int?,
      seenAt: json['seen_at'] as int?,
      groupChatId: json['group_chat_id'] as String,
      isNotification: json['is_notification'] as bool,
    );

Map<String, dynamic> _$UserGroupModelToJson(UserGroupModel instance) {
  final val = <String, dynamic>{
    'user_id': instance.userId,
    'joined_at': instance.joinedAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deleted_at', instance.deletedAt);
  writeNotNull('seen_at', instance.seenAt);
  val['group_chat_id'] = instance.groupChatId;
  val['is_notification'] = instance.isNotification;
  return val;
}
