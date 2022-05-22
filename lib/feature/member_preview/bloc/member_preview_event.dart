// Saturday, 21st May 2022 02:12 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of 'member_preview_bloc.dart';

abstract class MemberPreviewEvent extends Equatable {
  const MemberPreviewEvent();

  @override
  List<Object> get props => [];
}

class MemberPreviewStreamer extends MemberPreviewEvent {
  final String uid;
  const MemberPreviewStreamer({
    required this.uid,
  });
}

class MemberPreviewOnChangedEvent extends MemberPreviewEvent {
    final UserInfoModel info;
  const MemberPreviewOnChangedEvent({
    required this.info,
  });
}
