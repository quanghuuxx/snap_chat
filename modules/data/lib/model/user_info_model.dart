//* Sunday, 15th May 2022 09:38 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class UserInfoModel {
  final String id;
  final String name;
  final String? photoUrl;

  UserInfoModel({
    required this.id,
    required this.name,
    this.photoUrl,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}
