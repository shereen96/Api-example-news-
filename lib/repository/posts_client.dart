import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PostsClient {
  PostsClient._();
  static PostsClient postsClient = PostsClient._();
  http.Client client;
  initHttpClient() {
    if (client == null) {
      client = http.Client();
      return client;
    } else {
      return client;
    }
  }

  Future<Map<String, dynamic>> fetchPosts(
      String keyWord, String startDate) async {
    client = initHttpClient();
    String url =
        'http://newsapi.org/v2/everything?q=$keyWord&from=$startDate&sortBy=publishedAt&apiKey=450df5e3a4cf4982a1b94a3f70d43193';
    http.Response response = await client.get(url);
    String responseBody = response.body;
    Map<String, dynamic> map = json.decode(responseBody) as Map;
    return map;
  }
}
