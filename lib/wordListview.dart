import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'WordList',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // リスト一覧画面を表示
      home: WordListPage(),
    );
  }
}

class WordListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WordList',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Lemon',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 10,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
