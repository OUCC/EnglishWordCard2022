import 'dart:html';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'WordCard.g.dart';

@JsonSerializable()
class WordCard {
    String Front;   /// 表面の単語

    String Back;    /// 裏面の単語

    bool _memorized = false; /// 覚えたかどうか
    WordCard(this.Front, this.Back) {}


    factory WordCard.fromJson(Map<String, dynamic> json) => _$WordCardFromJson(json);
    Map<String, dynamic> toJson() => _$WordCardToJson(this);

    @override
    String toString() => json.encode(toJson()); // ここを追加


}