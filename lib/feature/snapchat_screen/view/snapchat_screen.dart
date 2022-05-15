//* Saturday, 14th May 2022 05:03 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main/home/view/home_page.dart';
import '../bloc/snapchat_bloc.dart';

class SnapchatScreen extends StatefulWidget {
  final UserInfo userInfo;
  const SnapchatScreen({super.key, required this.userInfo});

  @override
  State<SnapchatScreen> createState() => _SnapchatScreenState();
}

class _SnapchatScreenState extends StateBase<SnapchatScreen> {
  SnapchatBloc get snapchatBloc => context.read();

  @override
  void onViewCreated() {}

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
