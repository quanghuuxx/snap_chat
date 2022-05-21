// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_group_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberGroupInfo _$MemberGroupInfoFromJson(Map<String, dynamic> json) =>
    MemberGroupInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      joinedAt: json['joined_at'] as int,
      deletedAt: json['deleted_at'] as int?,
      seenAt: json['seen_at'] as int?,
    );

Map<String, dynamic> _$MemberGroupInfoToJson(MemberGroupInfo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo_url', instance.photoUrl);
  val['joined_at'] = instance.joinedAt;
  writeNotNull('deleted_at', instance.deletedAt);
  writeNotNull('seen_at', instance.seenAt);
  return val;
}
