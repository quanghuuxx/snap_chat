// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map json) => UserInfoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      status: json['status'] as String? ?? UserInfoModel.online,
      lastUseDeviceId: json['last_use_device_id'] as String,
      lastTimeOnline: json['last_time_online'] as int?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) {
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
  val['status'] = instance.status;
  val['last_use_device_id'] = instance.lastUseDeviceId;
  writeNotNull('last_time_online', instance.lastTimeOnline);
  return val;
}
