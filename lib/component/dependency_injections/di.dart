// Saturday, 21st May 2022 02:53 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

import '../../feature/main/home/bloc/home_bloc.dart';
import '../../feature/main/home/interactor/home_interactor.dart';
import '../../feature/main/home/interactor/home_repository.dart';
import '../../feature/main/home/interactor/impl/home_interactor.impl.dart';
import '../../feature/main/home/repository/home_repository.impl.dart';
import '../../feature/member_preview/bloc/member_preview_bloc.dart';
import '../../feature/member_preview/interactor/impl/member_preview_interactor.impl.dart';
import '../../feature/member_preview/interactor/member_preview_interactor.dart';
import '../../feature/member_preview/interactor/member_preview_repository.dart';
import '../../feature/member_preview/repository/member_preview_repository.impl.dart';
import '../../feature/snapchat_screen/bloc/snapchat_bloc.dart';
import '../../feature/snapchat_screen/interactor/impl/snapchat_interactor.impl.dart';
import '../../feature/snapchat_screen/interactor/snapchat_interactor.dart';
import '../../feature/snapchat_screen/interactor/snapchat_repository.dart';
import '../../feature/snapchat_screen/repository/snapchat_repository.impl.dart';

part './di_bloc.dart';
part './di_interactor.dart';
part './di_repository.dart';
part './di_collection.dart';
part './di_realtime_database.dart';

final injector = GetIt.instance;

class DependencyInjections {
  static void setup() {
    _injectorBloc();
    _injectorInteractor();
    _injectorRepository();
    _injectorCollection();
    _injectorRealtimeDatabase();
  }
}
