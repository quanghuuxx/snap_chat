// Saturday, 21st May 2022 11:14 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

enum CollectionName {
  group_chat,
  message,
  user_group,
}

typedef ListenDocument<T> = void Function(List<T> list);

abstract class CollectionBase<T extends DocumentModel> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<T> get collection => database(_db).withConverter<T>(
        fromFirestore: (doc, _) =>
            DocumentGenerate.fromFirestore(doc, fromJsonT),
        toFirestore: (data, _) => DocumentGenerate.toFirestore(data, toJsonT),
      );

  WriteBatch batch() => _db.batch();

  CollectionReference<Map<String, dynamic>> database(FirebaseFirestore db) {
    return db.collection(collectionName);
  }

  String get collectionName;

  T fromJsonT(Map<String, dynamic> json);
  Map<String, dynamic> toJsonT(T data);

  Future<DocumentReference<T>> add(T add);
  Future<void> set(T set);
  Future<void> update(T update);
  Future<void> delete(T delete);
}

extension CollectionReferenceExt<T extends DocumentModel>
    on CollectionReference<T> {
  Future<void> update(T data) async {
    final map = data.toJson()
      ..remove(DocumentGenerate.id)
      ..remove(DocumentGenerate.reference);

    doc(data.id).update(map);
  }
}
