// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupChatInfo _$GroupChatInfoFromJson(Map<String, dynamic> json) =>
    GroupChatInfo(
      id: json['id'] as String,
      reference: json['reference'],
      name: json['name_group'] as String,
      ownerId: json['owner_id'] as String,
      type: json['type'] as int,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      lastMessageId: json['last_message_id'] as String,
      membersId: (json['members_id'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GroupChatInfoToJson(GroupChatInfo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reference', instance.reference);
  val['name_group'] = instance.name;
  val['owner_id'] = instance.ownerId;
  val['type'] = instance.type;
  val['created_at'] = instance.createdAt;
  val['updated_at'] = instance.updatedAt;
  val['last_message_id'] = instance.lastMessageId;
  val['members_id'] = instance.membersId;
  return val;
}
