import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

/// リストでUserクラスを型に使いプロパティを使えるようにする.
final usersStreamProvider = StreamProvider<List<User>>((ref) {
  // FireStoreの全てのデータを取得.
  final collection = FirebaseFirestore.instance.collection('users');
  // データ（Map型）を取得.
  final stream = collection.snapshots().map(
        // CollectionのデータからUserクラスを生成する.
        (e) => e.docs.map((e) => User.fromJson(e.data())).toList(),
      );
  return stream;
});
