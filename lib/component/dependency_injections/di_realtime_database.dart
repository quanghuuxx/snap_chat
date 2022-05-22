// Saturday, 21st May 2022 03:16 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

part of './di.dart';

void _injectorRealtimeDatabase() {
  injector.registerFactory<UserInfoRealtimeDAO>(() => UserInfoRealtimeDAO());
}
