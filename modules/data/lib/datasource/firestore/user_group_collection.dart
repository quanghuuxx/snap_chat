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
  CollectionReference<DocumentModel<UserGroupModel>> connect(
    FirebaseFirestore firestore,
  ) {
    return firestore
        //
        .collection(CollectionName.user_group.name)
        .withConverter(
          fromFirestore: (doc, _) => DocumentModel.fromFirestore(doc, UserGroupModel.fromJson),
          toFirestore: (value, _) => value.data.toJson(),
        );
  }
}
