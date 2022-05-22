// Saturday, 21st May 2022 03:47 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';

import '../../../routers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends StateBase<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Column(
        children: [
          UserInfoModel(
            name: 'Nguyen Van A',
            id: 'iufbifqnfofd',
            photoUrl: 'assets/avatar_boy.jpg',
            lastUseDeviceId: 'device',
          ),
          UserInfoModel(
            name: 'Nguyen Thi B',
            id: 'uhiqbfnqoinf',
            photoUrl: 'assets/avatar_girl.jpg',
            lastUseDeviceId: 'device',
          ),
          UserInfoModel(
            name: 'Nguyen Thi C',
            id: 'uewbnndfnudu',
            photoUrl: 'assets/avatar_girl_2.jpg',
            lastUseDeviceId: 'device',
          ),
          UserInfoModel(
            name: 'Nguyen Van D',
            id: 'tiojenfoeow',
            photoUrl: 'assets/avatar_boy_1.jpg',
            lastUseDeviceId: 'device',
          ),
          UserInfoModel(
            name: 'Nguyen Van E',
            id: 'pokpmndnska',
            photoUrl: 'assets/avatar_boy_2.jpg',
            lastUseDeviceId: 'device',
          ),
          UserInfoModel(
            name: 'Nguyen THi F',
            id: 'dafaffsaass',
            photoUrl: 'assets/avatar_girl_1.jpg',
            lastUseDeviceId: 'device',
          ),
        ].genarate(
          (index, value) => InkWell(
            onTap: () {
              context.pushNamed(Routers.home, arguments: value);
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(value.photoUrl!),
                  maxRadius: 30,
                ),
                title: Text(value.name),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
