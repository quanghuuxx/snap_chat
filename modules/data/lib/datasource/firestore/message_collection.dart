// Saturday, 14th May 2022 09:01 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

class MessageCollection {
  final String groupChatId;

  MessageCollection({
    required this.groupChatId,
  });

  static const String senderIdClm = 'sender_id';
  static const String sentAtClm = 'sent_at';
  static const String contentClm = 'content';
  static const String contentTypeClm = 'content_type';
  static const String recallAtClm = 'recall_at';
  static const String hideWithClm = 'hide_with';
  static const String parentIdClm = 'parent_id';
  static const String typeClm = 'type';

  static final _MessageConllection _conllection = _MessageConllection();

  static _MessageConllection of(String groupChatId) {
    return _conllection..groupChatId = groupChatId;
  }
}

class _MessageConllection extends CollectionBase<MessageInfo> {
  late String groupChatId;

  @override
  CollectionReference<DocumentModel<MessageInfo>> connect(
    FirebaseFirestore firestore,
  ) {
    return firestore
        //
        .collection(CollectionName.group_chat.name)
        .doc(groupChatId)
        .collection(CollectionName.message.name)
        .withConverter(
          fromFirestore: (doc, _) => DocumentModel.fromFirestore(doc, MessageInfo.fromJson),
          toFirestore: (doc, _) => doc.data.toJson(),
        );
  }
}
