// Sunday, 15th May 2022 09:25 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

class UserGroupCollection extends CollectionBase<UserGroupModel> {
  static const String userIdClm = 'user_id';
  static const String joinedAtClm = 'joined_at';
  static const String deleteAtClm = 'delete_at';
  static const String seenAtClm = 'seen_at';
  static const String groupChatIdClm = 'group_chat_id';

  @override
  Future<DocumentReference<UserGroupModel>> add(UserGroupModel add) {
    return collection.add(add);
  }

  @override
  String get collectionName => CollectionName.user_group.name;

  @override
  Future<void> delete(UserGroupModel delete) {
    return collection.doc(delete.id).delete();
  }

  @override
  UserGroupModel fromJsonT(Map<String, dynamic> json) {
    return UserGroupModel.fromJson(json);
  }

  @override
  Future<void> set(UserGroupModel set) {
    return collection.doc(set.id).set(set);
  }

  @override
  Map<String, dynamic> toJsonT(UserGroupModel data) {
    return data.toJson();
  }

  @override
  Future<void> update(UserGroupModel update) {
    return collection.update(update);
  }

  Future<UserGroupModel?> findUserGroupById(String id) async {
    final snap = await collection.doc(id).get();
    return snap.data();
  }
}
