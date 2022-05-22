// Saturday, 21st May 2022 02:23 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.
part of 'member_preview_bloc.dart';

abstract class MemberPreviewState extends Equatable {
  const MemberPreviewState();

  @override
  List<Object> get props => [];
}

class MemberPreviewInitial extends MemberPreviewState {}

class MemberPreviewInfo extends MemberPreviewState {
  final UserInfoModel info;
  const MemberPreviewInfo({
    required this.info,
  });

  @override
  List<Object> get props => [
    info
  ];
}

class MemberPreviewOnChanged extends MemberPreviewInfo {
  const MemberPreviewOnChanged({required super.info});
}
