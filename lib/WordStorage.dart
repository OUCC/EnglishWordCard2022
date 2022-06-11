import "src/WordCard.dart";
import 'dart:html';
import 'dart:convert';



class WordStorage() {
    List<WordCard> GetWords() {}
    void SetWords(List<WordCard>  value) {}

}

class WebLocalStorage implements WordStorage {

  final Storage _localStorage = window.localStorage;
  final String KEY_NAME = "EnglishWords";
  List<WordCard> GetWords () {
    return List<WordCard>.filled(3, new WordCard("A", "b"));
    final temp = _localStorage[KEY_NAME] ?? "";
    return temp == "" ? List<WordCard>.filled(0, new WordCard("","")) : json.decode(temp);
  }

  void SetWords(List<WordCard> value)  {
        _localStorage[KEY_NAME] = json.encode(value);
  }
}