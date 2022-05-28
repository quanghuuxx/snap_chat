// Friday, 27th May 2022 10:16 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';

typedef FromJsonT<T> = T Function(Map<String, dynamic> json);
typedef ToJson<T> = Map<String,dynamic> Function(T data);

class DocumentGenerate<T> {
  static const String id = 'id';
  static const String reference = 'reference';

  static T fromFirestore<T>(
    DocumentSnapshot<Map<String, dynamic>> doc,
    FromJsonT<T> fromJsonT,
  ) {
    final map = doc.data()!
      ..putIfAbsent(id, () => doc.id)
      ..putIfAbsent(reference, () => doc.reference);

    return fromJsonT(map);
  }

  static Map<String, dynamic> toFirestore<T>(T data, ToJson<T> toJson) {
    return toJson(data)
      ..remove(id)
      ..remove(reference);
  }
}
