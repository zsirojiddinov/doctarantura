import 'package:doctarantura/default/default_text.dart';
import 'package:doctarantura/service/file_service.dart';

import '../utils/resource.dart';

class DefaultRepository {
  final FileService fileService;

  DefaultRepository(this.fileService) {
    setDefault();
  }

  setDefault() {
    fileService.writeFile(
      Resource.FILE_KIRISH_TILI,
      defaultKirishTili,
    );
  }
}
