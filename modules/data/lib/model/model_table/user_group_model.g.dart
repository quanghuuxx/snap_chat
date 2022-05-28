// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGroupModel _$UserGroupModelFromJson(Map<String, dynamic> json) =>
    UserGroupModel(
      id: json['id'] as String,
      reference: json['reference'],
      userId: json['user_id'] as String,
      joinedAt: json['joined_at'] as int,
      deletedAt: json['deleted_at'] as int?,
      seenAt: json['seen_at'] as int?,
      groupChatId: json['group_chat_id'] as String,
      isNotification: json['is_notification'] as bool,
    );

Map<String, dynamic> _$UserGroupModelToJson(UserGroupModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reference', instance.reference);
  val['user_id'] = instance.userId;
  val['joined_at'] = instance.joinedAt;
  writeNotNull('deleted_at', instance.deletedAt);
  writeNotNull('seen_at', instance.seenAt);
  val['group_chat_id'] = instance.groupChatId;
  val['is_notification'] = instance.isNotification;
  return val;
}
