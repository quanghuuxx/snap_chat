// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) => MessageInfo(
      id: json['id'] as String,
      reference: json['reference'],
      senderId: json['sender_id'] as String,
      sentAt: json['sent_at'] as int,
      content: json['content'] as String,
      contentType: json['content_type'] as String,
      recallAt: json['recall_at'] as int?,
      hideWith: (json['hide_with'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parentId: json['parent_id'] as String?,
      type: json['type'] as int,
    );

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reference', instance.reference);
  val['sender_id'] = instance.senderId;
  val['sent_at'] = instance.sentAt;
  val['content'] = instance.content;
  val['content_type'] = instance.contentType;
  writeNotNull('recall_at', instance.recallAt);
  writeNotNull('hide_with', instance.hideWith);
  writeNotNull('parent_id', instance.parentId);
  val['type'] = instance.type;
  return val;
}
