import 'dart:convert';

import 'package:http/http.dart';

CatFact catFactFromJson(String str) => CatFact.fromJson(json.decode(str));

String catFactToJson(CatFact data) => json.encode(data.toJson());

class CatFact {
  CatFact({
    required this.fact,
    required this.length,
  });

  String fact;
  int length;

  factory CatFact.fromJson(Map<String, dynamic> json) => CatFact(
        fact: json["fact"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "fact": fact,
        "length": length,
      };
}

CatPic catPicFromJson(String str) => CatPic.fromJson(json.decode(str));

String catPicToJson(CatPic data) => json.encode(data.toJson());

class CatPic {
  CatPic({
    required this.file,
  });

  String file;

  factory CatPic.fromJson(Map<String, dynamic> json) => CatPic(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}

// handle API response
class CatService {
  Future<CatFact> getCatFact() async {
    final response = await get(Uri.parse("https://catfact.ninja/fact"));
    final catFact = catFactFromJson(response.body);
    return catFact;
  }

  Future<CatPic> getCatPic() async {
    final response = await get(Uri.parse(
        "https://aws.random.cat/meow")); // https://aws.random.cat/meow
    final catPic = catPicFromJson(response.body);
    return catPic;
  }
}
