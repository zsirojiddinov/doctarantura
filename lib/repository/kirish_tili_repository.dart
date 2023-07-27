import 'dart:convert';

import 'package:doctarantura/models/kengayuvchi_kirish_tili.dart';
import 'package:doctarantura/service/file_service.dart';

import '../default/default_text.dart';
import '../utils/resource.dart';

class KirishTiliRepository {
  final FileService fileService;

  KirishTiliRepository(this.fileService);

  Future<KirishTili> getModel(String code) async {
    var model = KirishTili(code: "", nameRu: "", nameUz: "");
    var list = await getKirishList();
    list.map((e) {
      if (e.code == code) {
        model = e;
      }
    }).toList();
    return model;
  }

  Future<List<KirishTili>> getKirishList() async {
    String file = await fileService.readFile(Resource.FILE_KIRISH_TILI);
    print(file);
    var myList = <KirishTili>[];

    List<dynamic> list = json.decode(file);
    list.map((e) {
      myList.add(KirishTili.fromJson(e));
    }).toList();
    return myList;
  }

  Future<List<KirishTili>> addKirishList(
      String code, String nameUz, String nameRu) async {
    var myList = await getKirishList();
    myList.add(
      KirishTili(
        code: code,
        nameRu: nameRu,
        nameUz: nameUz,
      ),
    );
    var encode = json.encode(myList);
    await fileService.writeFile(Resource.FILE_KIRISH_TILI, encode);

    return getKirishList();
  }

  setDefault() async {
    String file = defaultKirishTili;
    var myList = <KirishTili>[];
    var split = file.split("\n");
    split.map((e) {
      var split2 = e.split("\t");
      var model = KirishTili(
        code: split2[0],
        nameUz: split2[2],
        nameRu: split2[1],
      );
      myList.add(model);
    }).toList();
    var encode = json.encode(myList);
    await fileService.writeFile(Resource.FILE_KIRISH_TILI, encode);
    return getKirishList();
  }
}
