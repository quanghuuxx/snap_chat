// Sunday, 29th May 2022 09:44 AM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/member_preview_bloc.dart';

class MemberStreamBuilder extends StatelessWidget {
  const MemberStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberPreviewBloc, MemberPreviewState>(
      builder: (context, state) {
        return Container();
      },
    );
  }
}

class MemberStreamSnapshot {
  
}