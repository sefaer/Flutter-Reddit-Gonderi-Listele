import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/reddit_model.dart';

class RedditRepo {
  Future<List<ChildData>> getReddit(String elemanSayisi) async {
    List<ChildData> _list = [];
    final response = await http.get(Uri.parse("https://www.reddit.com/r/flutterdev/top.json?count=$elemanSayisi"));
    var dataDecoded = jsonDecode(response.body);
    var results = dataDecoded['data']['children'];
    if (results is List) {
      _list.addAll(results.map((e) => ChildData.fromJson(e)).toList());
    }
    return _list;
  }
}
