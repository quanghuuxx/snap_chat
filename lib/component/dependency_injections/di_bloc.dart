// Saturday, 21st May 2022 02:55 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of './di.dart';

void _injectorBloc() {
  injector
    ..registerFactory<MemberPreviewBloc>(
      () => MemberPreviewBloc(
        interactor: injector.get(),
      ),
    )
    ..registerFactory<SnapchatBloc>(
      () => SnapchatBloc(
        interactor: injector.get(),
      ),
    )
    ..registerFactory<HomeBloc>(
      () => HomeBloc(
        interactor: injector.get(),
      ),
    );
}
