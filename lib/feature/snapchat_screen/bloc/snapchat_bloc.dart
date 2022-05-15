//* Sunday, 15th May 2022 10:13 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'snapchat_event.dart';
part 'snapchat_state.dart';

class SnapchatBloc extends Bloc<SnapchatEvent, SnapchatState> {
  SnapchatBloc() : super(SnapchatInitial()) {
    on<SnapchatEvent>((event, emit) {
      // TODO(quanghuuxx): implement event handler
    });
  }
}
