// Saturday, 21st May 2022 02:11 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import '../interactor/member_preview_interactor.dart';

part 'member_preview_event.dart';
part 'member_preview_state.dart';

class MemberPreviewBloc extends Bloc<MemberPreviewEvent, MemberPreviewState> {
  final MemberPreviewInteractor interactor;

  MemberPreviewBloc({required this.interactor}) : super(MemberPreviewInitial()) {
    on<MemberPreviewStreamer>(_onMemberPreviewStreamer);
    on<MemberPreviewOnChangedEvent>(_onMemberPreviewOnChangedEvent);
  }

  void _onMemberPreviewStreamer(
    MemberPreviewStreamer event,
    Emitter<MemberPreviewState> emit,
  ) async {
    _onStream(event.uid, emit);
  }

  void _onMemberPreviewOnChangedEvent(
    MemberPreviewOnChangedEvent event,
    Emitter<MemberPreviewState> emit,
  ) {
    emit(MemberPreviewOnChanged(info: event.info));
  }

  void _onStream(String uid, Emitter<MemberPreviewState> emit) async {
    interactor.stream(uid).listen((event) {
      if (event.snapshot.exists) {
        final userInfo = UserInfoModel.fromJson(event.snapshot.value! as Map<dynamic, dynamic>);
        if (!isClosed) {
          add(MemberPreviewOnChangedEvent(info: userInfo));
        }
      }
    });
  }
}
