// Saturday, 21st May 2022 02:49 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../component/dependency_injections/di.dart';
import '../../../../routers.dart';
import '../../../member_preview/bloc/member_preview_bloc.dart';
import '../../../member_preview/widget/avatar_member_chip.dart';
import '../../../snapchat_screen/model/snapchat_argument.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  final UserInfoModel user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends StateBase<HomePage> {
  HomeBloc get homeBloc => context.read();

  @override
  void onViewCreated() {
    homeBloc.add(HomeGetListUserInfoEvent(model: widget.user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeGetListSuccess) {
            return Column(
              children: state.list.genarate(
                (index, value) => InkWell(
                  onTap: () {
                    context.pushNamed(Routers.snapchat, arguments: ArgumentByMember(myInfo: widget.user, memberInfo: value));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        BlocProvider<MemberPreviewBloc>(
                          create: (context) => injector.get(),
                          child: AvatarMemberChip(size: 50, uid: value.id),
                        ),
                        Text(value.name),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(child: Text('loading'));
        },
      ),
    );
  }
}
