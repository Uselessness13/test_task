// To parse this JSON data, do
//
//     final gifInfo = gifInfoFromJson(jsonString);

import 'dart:convert';

class GifInfo {
  GifInfo({
    this.innerId,
    this.id,
    this.url,
  });

  int innerId;
  String id;
  String url;

  GifInfo copyWith({
    int innerId,
    String id,
    String url,
  }) =>
      GifInfo(
        innerId: innerId,
        id: id ?? this.id,
        url: url ?? this.url,
      );

  factory GifInfo.fromRawJson(String str) => GifInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GifInfo.fromJson(Map<String, dynamic> json) => GifInfo(
        innerId: json["inner_id"] == null ? null : json["inner_id"],
        id: json["id"] == null ? null : json["id"],
        url: json["images"]["original"]["url"] == null
            ? null
            : json["images"]["original"]["url"],
      );

  factory GifInfo.fromMap(Map<String, dynamic> json) => GifInfo(
        innerId: json["inner_id"] == null ? null : json["inner_id"],
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null
            ? null
            : json["url"],
      );
  Map<String, dynamic> toMap() => {
        "inner_id": innerId == null ? null : innerId,
        "url": url,
      };
  Map<String, dynamic> toJson() => {
        "inner_id": innerId == null ? null : innerId,
        "id": id == null ? null : id,
        "url": url == null ? null : url,
      };
}
