import 'dart:convert';

import '../models/word_model.dart';

class GenerateWordModelController {
  List<List<WordModel>> generate(String models) {
    var myAlgoritm = <List<WordModel>>[];
    models = models.trim();

    var algoritms = models.split("V");

    algoritms.map((e) {
      e = _removeQavs(e);
      var etap = e.split("*");
      var listModel = <WordModel>[];
      etap.map((item) {
        item = item.trim();
        var generateModel = _generateWordModel(item);
        listModel.add(generateModel);
      }).toList();
      myAlgoritm.add(listModel);
    }).toList();

 //   print(json.encode(myAlgoritm));
    return myAlgoritm;
  }

  String _removeQavs(String e) {
    e = e.trim();
    return e.substring(1, e.length - 1);
  }

  _generateWordModel(String item) {
    var wordModel = WordModel();
    var isHave = item.contains("↓");
    wordModel.isHave = isHave;
    item = item.replaceAll(" ", "");
    item = item.replaceAll("↓", "");
    if (item.contains("\$")) {
      item = item.replaceAll("\$", "");
      item = item.replaceAll("[", "");
      item = item.trim();
      var i1 = item.indexOf(",");
      var position = item.substring(0, i1);
      wordModel.position = position;
      item = item.replaceAll(position, "");
      item = item.replaceAll(",", "");
      item = item.replaceAll("1/", "");
      //  print(position);
      //  print(item);
      var i2 = item.indexOf("]");
      var len = item.substring(0, i2);
      // print(len);
      wordModel.len = len;
      item = item.replaceAll(len, "");
      item = item.replaceAll("]", "");
    }

    if (item.contains("(")) {
      if (item[0] != "(") {
        var i3 = item.indexOf("(");
        var wordGroup = item.substring(0, i3);
        wordModel.wordGroup = wordGroup;
        item = item.replaceAll(wordGroup, "");
      }
      item = item.replaceAll("(", "");
      item = item.replaceAll(")", "");
      wordModel.code = item;
    } else {
      wordModel.wordGroup = item;
    }

    return wordModel;
  }
}
