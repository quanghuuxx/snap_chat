// Saturday, 21st May 2022 10:53 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';

abstract class SnapchatArgument {
  final UserInfoModel myInfo;
  SnapchatArgument({
    required this.myInfo,
  });
}

class ArgumentByGroup extends SnapchatArgument {
  final String groupChatId;

  ArgumentByGroup({
    required super.myInfo,
    required this.groupChatId,
  });
}

class ArgumentByMember extends SnapchatArgument {
  final UserInfoModel memberInfo;

  ArgumentByMember({
    required super.myInfo,
    required this.memberInfo,
  });
}
