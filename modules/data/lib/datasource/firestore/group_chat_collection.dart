//* Saturday, 14th May 2022 07:12 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

class GroupChatCollection extends CollectionBase<GroupChatInfo> {
  static const String nameGroupClm = 'name_group';
  static const String ownerIdClm = 'owner_id';
  static const String typeClm = 'type';
  static const String createAtClm = 'create_at';
  static const String updateAtClm = 'update_at';
  static const String lastMessageIdClm = 'last_message_id';
  static const String membersId = 'members_id';

  @override
  CollectionReference<DocumentModel<GroupChatInfo>> connect(firestore) {
    return firestore
        //
        .collection(CollectionName.group_chat.name)
        .withConverter(
          fromFirestore: (doc, _) =>
              DocumentModel.fromFirestore(doc, GroupChatInfo.fromJson),
          toFirestore: (doc, _) => doc.data.toJson(),
        );
  }

  Future<DocumentModel<GroupChatInfo>?> findGroupChatInfoById(String id) async {
    final ref = collection.doc(id);
    return ref.get().then((value) => value.data());
  }
}
