// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationOverview _$ConversationOverviewFromJson(
        Map<String, dynamic> json) =>
    ConversationOverview(
      id: json['id'] as String,
      name: json['name'] as String?,
      ownerId: json['owner_id'] as String,
      type: json['type'] as int,
      lastMessage:
          MessageInfo.fromJson(json['last_message'] as Map<String, dynamic>),
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      peerInfo:
          UserInfoModel.fromJson(json['peer_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConversationOverviewToJson(
    ConversationOverview instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['owner_id'] = instance.ownerId;
  val['type'] = instance.type;
  val['last_message'] = instance.lastMessage;
  val['created_at'] = instance.createdAt;
  val['updated_at'] = instance.updatedAt;
  val['peer_info'] = instance.peerInfo;
  return val;
}
