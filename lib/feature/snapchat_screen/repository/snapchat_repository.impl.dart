//* Sunday, 15th May 2022 04:43 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../interactor/snapchat_repository.dart';

class SnapchatRepositoryImpl extends SnapchatRepository {
  final MessageCollection messageCollection;
  final UserGroupCollection userGroupCollection;
  final UserInfoCollection userInfoCollection;
  SnapchatRepositoryImpl({
    required this.messageCollection,
    required this.userGroupCollection,
    required this.userInfoCollection,
  });

  @override
  Future<void> insertMessage(DocumentModel<MessageInfo> message) {
    return messageCollection.add(message);
  }

  @override
  Future<void> updateMessage(DocumentModel<MessageInfo> message) {
    return messageCollection.update(message.reference, message.data.toJson());
  }

  @override
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId) async {
    final membersGroup = await userGroupCollection
        .query((query) => query.where(UserGroupCollection.groupChatIdClm, isEqualTo: groupChatId));
    final membersInfo = await userInfoCollection
        .query((query) => query.where('id', whereIn: membersGroup.map((e) => e.data.userId).toList()));

    List<MemberGroupInfo> list = [];
    for (var group in membersGroup) {
      final info = membersInfo.firstWhere((e) => e.data.id == group.data.userId);
      list.add(
        MemberGroupInfo(
          id: info.data.id,
          name: info.data.name,
          photoUrl: info.data.photoUrl,
          joinedAt: group.data.joinedAt,
          deletedAt: group.data.deletedAt,
          seenAt: group.data.seenAt,
        ),
      );
    }

    return list;
  }

  @override
  void listener(String groupChatId, Function(List<DocumentModel<MessageInfo>> snap) listener) {}
}
