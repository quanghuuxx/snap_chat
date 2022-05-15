//* Saturday, 14th May 2022 04:50 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/main/home/view/home_page.dart';
import 'feature/snapchat_screen/bloc/snapchat_bloc.dart';
import 'feature/snapchat_screen/view/snapchat_screen.dart';
import 'feature/splash_screen/splash_screen.dart';

class Routers {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String snapchat = '/snapchat';

  static Map<String, WidgetBuilder> routers = {
    splash: (context) {
      return const SplashScreen();
    },
    home: (context) {
      final args = context.currentRouter?.arguments as String?;
      return HomePage(title: args);
    },
    snapchat: (context) {
      final args = context.currentRouter!.arguments! as UserInfo;
      return BlocProvider(
        create: (context) => SnapchatBloc(),
        child:  SnapchatScreen(userInfo: args),
      );
    }
  };
}
