// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
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
  return val;
}
