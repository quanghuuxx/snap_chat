// Saturday, 21st May 2022 04:17 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, anyMap: true)
class UserInfoModel {
  final String id;
  final String name;
  final String? photoUrl;
  final String status;
  final String lastUseDeviceId;
  final int? lastTimeOnline;

  UserInfoModel({
    required this.id,
    required this.name,
    this.photoUrl,
    this.status = UserInfoModel.online,
    required this.lastUseDeviceId,
    this.lastTimeOnline,
  });

  static const online = 'online';
  static const offline = 'offline';

  factory UserInfoModel.fromJson(Map<dynamic, dynamic> json) => _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
