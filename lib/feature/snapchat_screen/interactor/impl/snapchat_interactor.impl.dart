// Sunday, 15th May 2022 04:41 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

import '../snapchat_interactor.dart';
import '../snapchat_repository.dart';

class SnapchatInteractorIml extends SnapchatInteractor {
  final SnapchatRepository repository;
  SnapchatInteractorIml({
    required this.repository,
  });

  @override
  Future<void> addMessage(DocumentModel<MessageInfo> message) {
    return repository.addMessage(message);
  }

  @override
  Future<void> updateMessage(DocumentModel<MessageInfo> message) {
    return repository.updateMessage(message);
  }

  @override
  void listener(String groupChatId, UserGroupModel myGroup, Function(List<DocumentModel<MessageInfo>> snap) listener) {
    return repository.listener(groupChatId, myGroup, listener);
  }

  @override
  Future<DocumentModel<GroupChatInfo>?> findGroupChatByMembers(List<String> membersId) {
    return repository.findGroupChatByMembers(membersId);
  }

  @override
  Future<List<MemberGroupInfo>> getMembersGroupInfo(String groupChatId) {
    return repository.getMembersGroupInfo(groupChatId);
  }

  @override
  Future<DocumentModel<UserGroupModel>?> findUserGroupById(String uid) {
    return repository.findUserGroupById(uid);
  }

  @override
  Future<UserInfoModel?> findUserInfoById(String uid) {
    return repository.findUserInfoById(uid);
  }

  @override
  Future<DocumentModel<GroupChatInfo>?> findGroupChatById(String groupChatId) {
    return repository.findGroupChatById(groupChatId);
  }
}
