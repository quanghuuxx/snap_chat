// Saturday, 21st May 2022 10:33 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'snapchat_event.dart';
part 'snapchat_state.dart';

class SnapchatBloc extends Bloc<SnapchatEvent, SnapchatState> {
  final ItemScrollController scrollToIndexController = ItemScrollController();

  SnapchatBloc() : super(SnapchatInitial()) {
    on<SnapchatCheckConversation>(_onSnapchatCheckConversation);
  }

  void _onSnapchatCheckConversation(
    SnapchatCheckConversation event,
    Emitter<SnapchatState> emit,
  ) {}
}
