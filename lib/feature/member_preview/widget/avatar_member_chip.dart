// Saturday, 21st May 2022 02:31 PM
// quanghuuxx (quanghuuxx@gmail.com)
// -----
// Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/member_preview_bloc.dart';

class AvatarMemberChip extends StatelessWidget {
  final String uid;
  final double size;

  const AvatarMemberChip({
    super.key,
    required this.size,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<MemberPreviewBloc>().add(MemberPreviewStreamer(uid: uid));
    });

    return BlocBuilder<MemberPreviewBloc, MemberPreviewState>(
      builder: (context, state) {
        if (state is MemberPreviewInfo) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(size),
                  child: Image.asset(
                    state.info.photoUrl ?? '',
                    fit: BoxFit.cover,
                    width: size,
                    height: size,
                  ),
                ),
                if (state.info.status == UserInfoModel.online)
                  Positioned(
                    right: 5,
                    bottom: 0,
                    child: Container(
                      width: size * 0.25,
                      height: size * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
                else if (state.info.lastTimeOnline != null)
                  Positioned(
                    right: -8,
                    bottom: 1,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Text(
                        getTime(state.info.lastTimeOnline!),
                        style: const TextStyle(
                          fontSize: 7,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          );
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  String getTime(int last) {
    last = last ~/ 1000;
    final cur = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final second = cur - last;
    if (second > 86400) {
      final day = second ~/ 86400;
      return '$day ngày';
    } else if (second > 3600) {
      final hour = second ~/ 3600;
      return '$hour giờ';
    } else if (second > 60) {
      final minute = second ~/ 60;
      return '$minute phút';
    }
    return 'vài giây';
  }
}
