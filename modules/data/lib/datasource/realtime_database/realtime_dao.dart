// Saturday, 21st May 2022 10:43 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:firebase_database/firebase_database.dart';

abstract class RealtimeDAO {
  final _db = FirebaseDatabase.instance;
  DatabaseReference get ref => _db.ref().child(node);

  // node name db
  String get node;

  Future<void> insert(String path, Map<String, dynamic> map);
  Future<TransactionResult> update(String path, Map<String, dynamic> map, {bool putIfAbsent = false});
  Future<void> delete(String path);
}

enum RealtimeDatabaseNode { user_info }
