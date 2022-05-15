//* Saturday, 14th May 2022 04:51 PM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../routers.dart';

class HomePage extends StatefulWidget {
  final String? title;
  const HomePage({super.key, this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? 'Home Page')),
      body: Column(
        children: [
          UserInfo(name: 'Nguyen Van A', uid: 'iufbifqnfofd'),
          UserInfo(name: 'Nguyen Van B', uid: 'uhiqbfnqoinf'),
        ].genarate(
          (index, value) => InkWell(
            onTap: () {
              context.pushNamed(Routers.snapchat, arguments: value);
            },
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(),
                title: Text(value.name),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo {
  final String name;
  final String uid;
  UserInfo({
    required this.name,
    required this.uid,
  });
}
