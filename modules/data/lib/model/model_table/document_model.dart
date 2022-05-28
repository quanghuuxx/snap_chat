// Saturday, 14th May 2022 09:25 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class DocumentModel {
  final String id;
  final Object? reference;

  DocumentModel({
    required this.id,
    this.reference,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) => _$DocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);
}
