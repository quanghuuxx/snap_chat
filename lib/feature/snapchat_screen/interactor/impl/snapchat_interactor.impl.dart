//* Sunday, 15th May 2022 04:41 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../snapchat_interactor.dart';
import '../snapchat_repository.dart';

class SnapchatInteractorIml extends SnapchatInteractor {
  final SnapchatRepository repository;
  SnapchatInteractorIml({
    required this.repository,
  });

  @override
  Future<void> insertMessage(DocumentModel<MessageInfo> message) {
    return repository.insertMessage(message);
  }

  @override
  Future<void> updateMessage(DocumentModel<MessageInfo> message) {
    return repository.updateMessage(message);
  }

  @override
  void listener(String groupChatId, Function(List<DocumentModel<MessageInfo>> snap) listener) {
    return repository.listener(groupChatId, listener);
  }
}
