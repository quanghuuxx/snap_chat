//* Saturday, 14th May 2022 07:13 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

typedef QueryCollection<T> = Query<DocumentModel<T>> Function(
  CollectionReference<DocumentModel<T>> collection,
);

abstract class CollectionBase<T> {
  CollectionReference<DocumentModel<T>> get collection =>
      connect(FirebaseFirestore.instance);
  WriteBatch get batch => FirebaseFirestore.instance.batch();

  CollectionReference<DocumentModel<T>> connect(FirebaseFirestore firestore);

  Future<void> insert(DocumentModel<T> doc) {
    return collection.add(doc);
  }

  Future<void> delete(DocumentModel<T> doc) {
    return collection.doc(doc.id).delete();
  }

  Future<void> update(String id, Map<String, dynamic> update) {
    return collection.doc(id).update(update);
  }

  Stream openStream(QueryCollection query) {
    return query(collection).snapshots();
  }

  Future<List<DocumentModel<T>>> query(QueryCollection<T> query) async {
    final ref = await query(collection).get();
    return ref.docs.map((e) => e.data()).toList();
  }

  Future<DocumentModel<T>?> findById(String id) async {
    final ref = collection.doc(id);
    return ref.get().then((value) => value.data());
  }
}

enum CollectionName {
  group_chat,
  message,
  user_group,
  user_info,
}
