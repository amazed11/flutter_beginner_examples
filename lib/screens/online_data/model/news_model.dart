// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
    this.total,
    this.limit,
    this.start,
    this.page,
  });

  List<NewsData>? data;
  int? total;
  int? limit;
  int? start;
  int? page;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data:
            List<NewsData>.from(json["data"].map((x) => NewsData.fromJson(x))),
        total: json["total"],
        limit: json["limit"],
        start: json["start"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
        "limit": limit,
        "start": start,
        "page": page,
      };
}

class NewsData {
  NewsData({
    this.id,
    this.tags,
    this.lang,
    this.url,
    this.title,
    this.source,
    this.summary,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  List<dynamic>? tags;
  Lang? lang;
  String? url;
  String? title;
  Source? source;
  String? summary;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["_id"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        lang: langValues.map[json["lang"]],
        url: json["url"],
        title: json["title"],
        source: sourceValues.map[json["source"]],
        summary: json["summary"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "lang": langValues.reverse[lang],
        "url": url,
        "title": title,
        "source": sourceValues.reverse[source],
        "summary": summary,
        "image_url": imageUrl,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

enum Lang { NP }

final langValues = EnumValues({"np": Lang.NP});

enum Source {
  KATHMANDUPRESS_COM,
  EKANTIPUR_COM,
  SETOPATI_COM,
  ONLINEKHABAR_COM
}

final sourceValues = EnumValues({
  "ekantipur.com": Source.EKANTIPUR_COM,
  "kathmandupress.com": Source.KATHMANDUPRESS_COM,
  "onlinekhabar.com": Source.ONLINEKHABAR_COM,
  "setopati.com": Source.SETOPATI_COM
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
