import 'dart:convert';

ChildData postFromJson(String str) => ChildData.fromJson(json.decode(str));

String postToJson(ChildData data) => json.encode(data.toJson());

class ChildData {
  ChildData(
      {this.thumbnail,
        this.author,
        this.author_fullname,
        this.score,
        this.date,
        this.title,
        this.url,
        this.id,
        this.subreddit_name_prefixed,
        this.num_comments,});

  String? thumbnail;
  String? author;
  String? author_fullname;
  int? score;
  String? date;
  String? subreddit_name_prefixed;
  String? title;
  String? url;
  String? id;
  int? num_comments;
  //String? goldmedals;

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
    thumbnail: json["data"]["thumbnail"].toString().contains(".com")
        ? json["data"]["thumbnail"]
        : "https://hayateli.com/wp-content/uploads/2021/05/alert-icon-5807a14f5f9b5805c2aa679c-1024x683.png",
    author: json["data"]["author"] ?? "Sefa Er",
    author_fullname: json["data"]["author_fullname"] ?? "Sefa Er",
    score: json["data"]["score"] ?? 5,
    date: json["data"]["start_date"] ?? "12.12.12",
    title: json["data"]["title"] ?? "this title",
    num_comments: json["data"]["num_comments"] ?? 5,
    url:json["data"]["url"] ?? "https://seeklogo.com/images/R/reddit-logo-23F13F6A6A-seeklogo.com.png",
    subreddit_name_prefixed:json["data"]["subreddit_name_prefixed"] ?? "r/Flutter",
    id:json["data"]["id"],
  );
  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "author": author,
    "score": score,
    "start_date": date,
    "title": title,
    "author_fullname": author_fullname,
    "url": url,
    "subreddit_name_prefixed": subreddit_name_prefixed,
    "id": id,
  };
}
