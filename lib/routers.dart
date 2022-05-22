// Saturday, 21st May 2022 03:39 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:data/model/model_table/user_info_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/dependency_injections/di.dart';
import 'feature/login/view/login_screen.dart';
import 'feature/main/home/bloc/home_bloc.dart';
import 'feature/main/home/view/home_page.dart';
import 'feature/snapchat_screen/bloc/snapchat_bloc.dart';
import 'feature/snapchat_screen/model/snapchat_argument.dart';
import 'feature/snapchat_screen/view/snapchat_screen.dart';
import 'feature/splash_screen/splash_screen.dart';

class Routers {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String snapchat = '/snapchat';
  static const String login = '/login';

  static Map<String, WidgetBuilder> routers = {
    splash: (context) {
      return const SplashScreen();
    },
    home: (context) {
      final args = context.currentRouter!.arguments! as UserInfoModel;
      return BlocProvider<HomeBloc>(
        create: (context) => injector.get(),
        child: HomePage(user: args),
      );
    },
    snapchat: (context) {
      final args = context.currentRouter!.arguments! as SnapchatArgument;
      return BlocProvider<SnapchatBloc>(
        create: (context) => injector.get(),
        child: SnapchatScreen(argument: args),
      );
    },
    login: (context) => const LoginScreen(),
  };
}
