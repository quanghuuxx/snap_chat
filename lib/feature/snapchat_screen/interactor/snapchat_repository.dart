//* Sunday, 15th May 2022 04:36 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class SnapchatRepository {
  void listener(String groupChatId, Function(List<DocumentModel<MessageInfo>> snap) listener);

  Future<void> insertMessage(DocumentModel<MessageInfo> message);
  Future<void> updateMessage(DocumentModel<MessageInfo> message);
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId);
}
