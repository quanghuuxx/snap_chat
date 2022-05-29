// Saturday, 14th May 2022 09:01 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'dart:async';

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

  StreamSubscription<QuerySnapshot<MessageInfo>>? subscription;

  @override
  CollectionReference<Map<String, dynamic>> database(FirebaseFirestore db) {
    return db
        .collection(CollectionName.group_chat.name)
        .doc(groupChatId)
        .collection(CollectionName.message.name);
  }

  @override
  Future<DocumentReference<MessageInfo>> add(MessageInfo add) {
    return collection.add(add);
  }

  @override
  String get collectionName => CollectionName.message.name;

  @override
  Future<void> delete(MessageInfo delete) {
    return collection.doc(delete.id).delete();
  }

  @override
  MessageInfo fromJsonT(Map<String, dynamic> json) {
    return MessageInfo.fromJson(json);
  }

  @override
  Future<void> set(MessageInfo set) {
    return collection.doc(set.id).set(set);
  }

  @override
  Map<String, dynamic> toJsonT(MessageInfo data) {
    return data.toJson();
  }

  @override
  Future<void> update(MessageInfo update) {
    return collection.update(update);
  }

  Future<MessageInfo?> findMessageById(String id) async {
    final snap = await collection.doc(id).get();
    return snap.data();
  }

  void listen(
      {required UserGroupModel userGroup,
      required ListenDocument<MessageInfo> listen}) {
    assert(subscription == null, 'MessageColection avaliable listen');
    subscription = collection
        .where(MessageCollection.sentAtClm,
            isGreaterThan: userGroup.deletedAt ?? 0)
        .orderBy(MessageCollection.sentAtClm, descending: true)
        .snapshots()
        .listen(null);

    subscription!.onData((query) {
      final messages = query.docs.map((e) => e.data()).toList()
        ..removeWhere((e) => e.hideWith?.contains(userGroup.userId) == true);

      listen(messages);
    });
  }

  void removeListen() {
    subscription?.cancel();
    subscription = null;
  }
}

enum MessageContentType {
  text,
  image_url,
}

enum MessageType {
  user_sent,
  system_sent,
}
