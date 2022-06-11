import 'package:flutter/material.dart';

void main() => runApp(Wordform());

class Wordform extends StatefulWidget {
  @override
  _WordformState createState() => _WordformState();
}
class _WordformState extends State<Wordform> {
  String _text_front = '';
  String _text_back = '';
  
  Widget build(BuildContext context) {
      return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
        home:Scaffold(
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
                  // "pop"で前の画面に戻る
                  // "pop"の引数から前の画面にデータを渡す
                        Navigator.of(context).pop(_text_front);
                        Navigator.of(context).pop(_text_back);
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
      ),
    );
  }
}