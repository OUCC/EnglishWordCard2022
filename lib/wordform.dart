import 'package:flutter/material.dart';
import "model/WordCard.dart";
import "model/WordStorage.dart";

class Wordform extends StatefulWidget {
  WordStorage storage;
  bool isNewWord;
    // 以下を実装、コンストラクタで値を受領
  Wordform({ required this.storage, required this.isNewWord}) ;


  @override
  _WordformState createState() => _WordformState(this.storage, this.isNewWord);
}
class _WordformState extends State<Wordform> {
  final WordStorage storage;
  final bool isNewWord;
  String _text_front = '';
  String _text_back = '';
  
  _WordformState(this.storage, this.isNewWord ){}
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('英単語の追加'), 
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text_front, style: TextStyle(color: Colors.black, fontSize:50.0)),
              
            // テキスト入力
              TextField(
                decoration: InputDecoration(
                  hintText:'英単語を入力してください',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.amber,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.amber,
                   )
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                ),
              // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
              onChanged: (String value_front) {
                // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                  // データを変更
                    _text_front = value_front;
                  });
                },
              ),
              Text(_text_back, style: TextStyle(color: Colors.black, fontSize:50.0)),
              const SizedBox(height: 8),
            // テキスト入力
              TextField(
                decoration: InputDecoration(
                  hintText:'訳を入力してください',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.amber,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.amber,
                   )
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  )
                ),
              // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                onChanged: (String value_back) {
                // データが変更したことを知らせる（画面を更新する）
                  setState(() {
                  // データを変更
                    _text_back = value_back;
                  });
                },
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // リスト追加ボタン
                children: <Widget>[
                  Container(
                    child:SizedBox(
                      width: 150, //横幅
                      height: 80,
                      child:ElevatedButton(
                        child: const Text('追加'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        final list = storage.GetWords();
                        list.add(new WordCard(_text_front, _text_back));
                        storage.SetWords(list);
                        Navigator.of(context).pop("a");
                      },
                      ),
                    ),
                  ),
                  Container(
                    child:SizedBox(
                      width: 150, //横幅
                      height: 80,
                      child:ElevatedButton(
                        child: const Text('キャンセル'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                // ボタンをクリックした時の処理
                  onPressed: () {
                  // "pop"で前の画面に戻る
                    Navigator.of(context).pop();
                  },
                      ),
                    ),
                ),
                ],
              ),
              
            ],
          ),
        ),
    );
  }
}