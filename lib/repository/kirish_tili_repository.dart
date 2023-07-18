import 'package:doctarantura/models/kengayuvchi_kirish_tili.dart';
import 'package:doctarantura/service/file_service.dart';

import '../utils/resource.dart';

class KirishTiliRepository {
  final FileService fileService;

  KirishTiliRepository(this.fileService);

  Future<KirishTili> getModel(String code) async {
    var model = KirishTili("", "", "");
    var list = await getKirishList();
    list.map((e) {
   //   print(e.code);
      if (e.code == code) {
        model = e;
      }
    }).toList();
    return model;
  }

  Future<List<KirishTili>> getKirishList() async {
    String file = await fileService.readFile(Resource.FILE_KIRISH_TILI);
    var split = file.split("\n");
    var myList = <KirishTili>[];

    split.map((e) {
      var split2 = e.split("\t");
      var model = KirishTili(split2[0], split2[1], split2[2]);
      myList.add(model);
    }).toList();
    return myList;
  }
}
