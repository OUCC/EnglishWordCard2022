import "WordCard.dart";
import 'dart:html';
import 'dart:convert';
import 'package:flip_card/flip_card.dart';

/// 単語保管クラスです。
class WordStorage {
    List<WordCard> GetWords() => List<WordCard>.filled(0, new WordCard("", ""));
    void SetWords(List<WordCard>  value) {}

}

class WebLocalStorage implements WordStorage {

  final Storage _localStorage = window.localStorage;
  final String KEY_NAME = "EnglishWords";
  List<WordCard> GetWords () {
    final temp = _localStorage[KEY_NAME] ?? "";
    final list = List<WordCard>.filled(0, new WordCard("",""));
    if(temp == "") return list;
    Iterable l = json.decode(temp);
    return List<WordCard>.from(l.map((word) => WordCard.fromJson(word)));
  }

  void SetWords(List<WordCard> value)  {
        _localStorage[KEY_NAME] = json.encode(value);
  }
}