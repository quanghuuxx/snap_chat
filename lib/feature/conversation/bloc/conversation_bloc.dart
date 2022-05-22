// Saturday, 21st May 2022 05:22 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(ConversationInitial()) {
    on<ConversationEvent>((event, emit) {});
  }
}
