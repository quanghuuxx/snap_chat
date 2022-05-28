// Saturday, 14th May 2022 07:12 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

class GroupChatCollection extends CollectionBase<GroupChatInfo> {
  static const String nameGroupClm = 'name_group';
  static const String ownerIdClm = 'owner_id';
  static const String typeClm = 'type';
  static const String createAtClm = 'create_at';
  static const String updateAtClm = 'update_at';
  static const String lastMessageIdClm = 'last_message_id';
  static const String membersId = 'member_ids';

  @override
  Future<DocumentReference<GroupChatInfo>> add(GroupChatInfo add) {
    return collection.add(add);
  }

  @override
  String get collectionName => CollectionName.group_chat.name;

  @override
  Future<void> delete(GroupChatInfo delete) {
    return collection.doc(delete.id).delete();
  }

  @override
  GroupChatInfo fromJsonT(Map<String, dynamic> json) {
    return GroupChatInfo.fromJson(json);
  }

  @override
  Future<void> set(GroupChatInfo set) {
    return collection.doc(set.id).set(set);
  }

  @override
  Map<String, dynamic> toJsonT(GroupChatInfo data) {
    return data.toJson();
  }

  @override
  Future<void> update(GroupChatInfo update) {
    return collection.update(update);
  }

  Future<GroupChatInfo?> findGroupChatById(String id) async {
    final snap = await collection.doc(id).get();
    return snap.data();
  }

  Future<GroupChatInfo?> findGroupChatByMembers(List<String> membersId) async {
    final respone = await collection
        .where(GroupChatCollection.membersId, isEqualTo: membersId)
        .where(GroupChatCollection.typeClm, isEqualTo: 0)
        .get();

    if (respone.docs.isEmpty) {
      return null;
    }
    return respone.docs.first.data();
  }
}
