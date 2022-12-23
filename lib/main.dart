import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_app/provider/provider.dart';
import 'package:freezed_app/ui/detail.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StreamProviderを読み取る（取得できる型は `AsyncValue<T>`）
    final users = ref.watch(usersStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('個人情報アプリ'),
      ),
      // AsyncValue は `.when` を使ってハンドリングする
      body: users.when(
          // 処理中は `loading` で指定したWidgetが表示される
          loading: () => const CircularProgressIndicator(),
          // エラーが発生した場合に表示されるWidgetを指定
          error: (error, stack) => Text('Error: $error'),
          // 取得した `users` が `data` で使用できる
          data: (users) {
            return ListView.builder(
                itemCount: users.length, // リストの数をカウントする
                itemBuilder: (context, index) {
                  // 値とindexを渡す
                  final user = users[index]; // クラスのプロパティを使うための変数
                  return ListTile(
                    title: Text(user.name), // クラスのnameプロパティを表示
                    onTap: () {
                      // リストをタップすると詳細画面へ遷移する設定
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Detail(
                                    user: users[index],
                                  )));
                    },
                  );
                });
          }),
    );
  }
}
