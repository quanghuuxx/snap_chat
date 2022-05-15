//* Sunday, 15th May 2022 09:58 AM
//* quanghuuxx (quanghuuxx@gmail.com)
//* -----
//* Copyright 2022 quanghuuxx, Ltd. All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data.dart';

class UserInfoCollection extends CollectionBase<UserInfoModel> {
  static const String idClm = 'id';
  static const String nameClm = 'name';
  static const String photoUrlClm = 'photo_url';

  @override
  CollectionReference<DocumentModel<UserInfoModel>> connect(
    FirebaseFirestore firestore,
  ) {
    return firestore
        //
        .collection(CollectionName.user_info.name)
        .withConverter(
          fromFirestore: (doc, _) =>
              DocumentModel.fromFirestore(doc, UserInfoModel.fromJson),
          toFirestore: (value, _) => value.data.toJson(),
        );
  }
}
