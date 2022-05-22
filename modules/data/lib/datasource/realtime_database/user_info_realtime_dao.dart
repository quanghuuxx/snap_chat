// Saturday, 21st May 2022 11:53 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:firebase_database/firebase_database.dart';

import '../../data.dart';

class UserInfoRealtimeDAO extends RealtimeDAO {
  static const Map<String, dynamic> setOffline = {
    'status': 'offline',
    'last_time_online': ServerValue.timestamp,
  };

  @override
  Future<void> delete(String path) {
    return ref.child(path).remove();
  }

  @override
  Future<void> insert(String path, Map<String, dynamic> map) {
    return ref.child(path).set(map);
  }

  @override
  String get node => RealtimeDatabaseNode.user_info.name;

  @override
  Future<TransactionResult> update(String path, Map<String, dynamic> map, {bool putIfAbsent = false}) {
    return ref.child(path).runTransaction((key) {
      if (key == null) {
        if (putIfAbsent) {
          insert(path, map);
        }
        return Transaction.abort();
      }

      return Transaction.success(map);
    });
  }

  Future<UserInfoModel?> findByPath(String path) async {
    final pres = await ref.child(path).get();
    if (pres.exists) {
      return UserInfoModel.fromJson(pres.value! as Map);
    }
    return null;
  }

  Future<void> configPresenceUser(String path, Map<String, dynamic> map) async {
    ref.child(path)
      ..update(map)
      ..onDisconnect().update(setOffline);
  }

  Stream<DatabaseEvent> stream(String path) {
    return ref.child(path).onValue;
  }
}
