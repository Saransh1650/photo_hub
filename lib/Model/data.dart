import 'dart:convert';

class Data {
  int total;
  int totalHits;
  List<Hit> hits;

  Data({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        totalHits: json["totalHits"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "hits": List<dynamic>.from(hits.map((x) => x.toJson())),
      };
}

class Hit {
  int id;
  String pageUrl;
  Type type;
  String tags;
  int duration;
  Videos videos;
  int views;
  int downloads;
  int likes;
  int comments;
  int userId;
  String user;
  String userImageUrl;

  Hit({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.duration,
    required this.videos,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"],
        pageUrl: json["pageURL"],
        type: typeValues.map[json["type"]]!,
        tags: json["tags"],
        duration: json["duration"],
        videos: Videos.fromJson(json["videos"]),
        views: json["views"],
        downloads: json["downloads"],
        likes: json["likes"],
        comments: json["comments"],
        userId: json["user_id"],
        user: json["user"],
        userImageUrl: json["userImageURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pageURL": pageUrl,
        "type": typeValues.reverse[type],
        "tags": tags,
        "duration": duration,
        "videos": videos.toJson(),
        "views": views,
        "downloads": downloads,
        "likes": likes,
        "comments": comments,
        "user_id": userId,
        "user": user,
        "userImageURL": userImageUrl,
      };
}

// ignore: constant_identifier_names
enum Type { ANIMATION, FILM }

final typeValues = EnumValues({"animation": Type.ANIMATION, "film": Type.FILM});

class Videos {
  Large large;
  Large medium;
  Large small;
  Large tiny;

  Videos({
    required this.large,
    required this.medium,
    required this.small,
    required this.tiny,
  });

  factory Videos.fromRawJson(String str) => Videos.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
        small: Large.fromJson(json["small"]),
        tiny: Large.fromJson(json["tiny"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large.toJson(),
        "medium": medium.toJson(),
        "small": small.toJson(),
        "tiny": tiny.toJson(),
      };
}

class Large {
  String url;
  int width;
  int height;
  int size;
  String thumbnail;

  Large({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.thumbnail,
  });

  factory Large.fromRawJson(String str) => Large.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "size": size,
        "thumbnail": thumbnail,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
