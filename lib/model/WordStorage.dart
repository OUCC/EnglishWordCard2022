import "WordCard.dart";
import 'dart:html';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';

/// 単語保管クラスです。
class WordStorage {
    List<WordCard> GetWords() => [];  // 単語一覧の取得
    void SetWords(List<WordCard>  value) {}     // 単語リストの保存
    void AddWords(WordCard card) {}             // 単語の追加

}

/// webアプリのときの単語保管クラス
class WebLocalStorage implements WordStorage {

  final Storage _localStorage = window.localStorage;
  final String KEY_NAME = "EnglishWords";
  List<WordCard> wordList = [];

  List<WordCard> GetWords () {
    final temp = _localStorage[KEY_NAME] ?? "";
    if(temp == "") return this.wordList;
    Iterable l = json.decode(temp);
    this.wordList = List<WordCard>.from(l.map((word) => WordCard.fromJson(word)));
    return this.wordList;
  }

  // 単語リストの保存
  void SetWords(List<WordCard> value)  {
    _localStorage[KEY_NAME] = json.encode(value);
  }

  // 単語の追加
  void AddWords(WordCard card) {
      this.wordList.add(card);
      SetWords(wordList);
  }
}