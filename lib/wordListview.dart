
import 'package:flutter/material.dart';
import "model/WordCard.dart";
import "model/WordStorage.dart";
import "wordform.dart";
import 'package:flip_card/flip_card.dart';

/// 単語一覧ウィジェットです。
class WordList extends StatefulWidget {
  @override
  _WordListState createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  WordStorage _storage = WebLocalStorage();
  List<WordCard> _wordList = List<WordCard>.filled(0, new WordCard("",""));
  @override
  void initState() {
    setState(() {
      _wordList = _storage.GetWords();
    });
  }

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
      home: Scaffold(
      appBar: AppBar(
        title: Text(
          'WordList',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      // 一覧画面
      body: 
        ListView.builder(
          itemCount : _wordList.length,
          itemBuilder :(BuildContext context, int index) {
            return FlipCard(
              front: Card(
                child: Text(
                  "${_wordList[index].Front}",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ), // カード前面に表示するWidget
              back: Card  (
                child: Text(
                  "${_wordList[index].Back}",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ), // カード背面に表示するWidget
              direction: FlipDirection.VERTICAL, // カード回転向き(HORIZONTAL:横<デフォルト>, VERTICAL:縦)
              flipOnTouch: true, // タッチ可否(true:カード部タップで回転する<デフォルト>, false:タップしても回転しない)
              speed: 500, // 回転スピード(500ミリ秒<デフォルト>)
              onFlip: () {}, // タップイベント
              onFlipDone: (isFront) {}, // タップイベント(前面かどうかbool値で判断できる) 
            );
          }
        ),
        
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "btnEdit",
            child: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.add,
            ),
            heroTag: "btnAdd",
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Wordform(storage:this._storage, isNewWord:true);
                  },
                ),
              );
              setState((){
                _wordList = _storage.GetWords();
              });
            },
          ),
        ],
      ),
        backgroundColor: Colors.white,
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
    _storage.SetWords(_wordList);
  }
}
