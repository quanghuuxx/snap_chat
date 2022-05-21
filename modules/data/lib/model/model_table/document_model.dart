//* Saturday, 14th May 2022 09:25 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentModel<T> {
  final String id;
  final DocumentReference<Map<String, dynamic>> reference;
  final T data;

  DocumentModel({
    required this.id,
    required this.reference,
    required this.data,
  });

  factory DocumentModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) {
    return DocumentModel(id: document.id,reference: document.reference, data: fromJsonT(document.data()!));
  }

  Map<String, dynamic> toFirestore(
    Map<String, dynamic> Function(T data) toJsonT,
  ) {
    return toJsonT(data);
  }
}
