class KirishTili {
  String code;
  String nameRu;
  String nameUz;

  KirishTili({this.code = "", this.nameRu = "", this.nameUz = ""});

  factory KirishTili.fromJson(Map<String, dynamic> json) {
    return KirishTili(
      code: json['code'],
      nameRu: json['nameRu'],
      nameUz: json['nameUz'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['nameRu'] = nameRu;
    data['nameUz'] = nameUz;
    return data;
  }
}
