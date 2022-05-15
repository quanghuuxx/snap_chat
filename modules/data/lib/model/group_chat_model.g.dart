// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupChatInfo _$GroupChatInfoFromJson(Map<String, dynamic> json) =>
    GroupChatInfo(
      name: json['name_group'] as String,
      ownerId: json['owner_id'] as String,
      type: json['type'] as int,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      lastMessageId: json['last_message_id'] as String,
    );

Map<String, dynamic> _$GroupChatInfoToJson(GroupChatInfo instance) =>
    <String, dynamic>{
      'name_group': instance.name,
      'owner_id': instance.ownerId,
      'type': instance.type,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'last_message_id': instance.lastMessageId,
    };
