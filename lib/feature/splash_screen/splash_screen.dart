// Saturday, 21st May 2022 03:50 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends StateBase<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('Splash Screen'),
      ),
    );
  }

  @override
  void onViewCreated() async {

    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacementNamed(Routers.login),
    );
  }
}
