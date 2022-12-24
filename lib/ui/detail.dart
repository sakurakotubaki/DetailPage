import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

class Detail extends ConsumerWidget {
  // ListView.builderから値を受け取れるように、コンストラクターを定義する
  const Detail({super.key, required this.user});
  // 受け取った値を保存する変数を作る
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('詳細ページ'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          // 受け取った値を保存した変数を使って、Userクラスのプロパティを表示できるようにする
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text('名前: '),
                Text(
                  '${user.name}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text('メールアドレス: '),
                Text(
                  '${user.email}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text('住所: '),
                Text(
                  '${user.address}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text('個人番号: '),
                Text(
                  '${user.personalNumber}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.topLeft,
            width: 250,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Text("""
                    これは${user.name}さんの\n
                    個人情報が記載された\n
                    詳細ページです。
                    """, style: TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }
}
