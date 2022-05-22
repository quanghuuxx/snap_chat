// Saturday, 21st May 2022 02:55 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of './di.dart';

void _injectorInteractor() {
  injector
    ..registerFactory<MemberPreviewInteractor>(
      () => MemberPreviewInteractorImpl(
        repository: injector.get(),
      ),
    )
    ..registerFactory<SnapchatInteractor>(
      () => SnapchatInteractorIml(
        repository: injector.get(),
      ),
    )
    ..registerFactory<HomeInteractor>(
      () => HomeInteractorImpl(
        repository: injector.get(),
      ),
    );
}
