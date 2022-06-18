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
        title: Text('単語の追加'), 
      ),
      body: Container(   
        color: Colors.grey[200], 
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child:Image.asset(
                'image/E-chan3.png'
              ),
            ), 
            Container(
              padding: EdgeInsets.only(top:10,right:30,left:30,bottom:5),
              child:TextFormField(
                decoration: InputDecoration(
                hintText:'表面（単語）',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.green,
                    )
                  ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.green,
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
              ),
            // テキスト入力
            Container(
              padding:EdgeInsets.only(top:10,right:30,left:30),
              child:TextFormField(
                decoration: InputDecoration(
                  hintText:'裏面（答え）',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.green,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                    color: Colors.green,
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
            ),
              Container(
                padding: EdgeInsets.all(30),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              // リスト追加ボタン
                  children: <Widget>[
                    Container(
                      child:SizedBox(
                        width: 150, 
                        height: 40,
                        child:ElevatedButton(
                          child: const Text(
                            '追加',
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
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
                      padding: EdgeInsets.all(10),
                    ),
                    Container(
                      child:SizedBox(
                        width: 150, 
                        height: 40,
                        child:ElevatedButton(
                          child: const Text(
                            'キャンセル',
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
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
              ), 
          ],
          ),
        ),
    );
  }
}