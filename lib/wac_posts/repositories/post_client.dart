import 'package:http/http.dart' as http;
import 'dart:convert';

class PostClient {
  PostClient._();
  static PostClient postClient = PostClient._();
  http.Client client;

  initClient() {
    if (client == null) {
      client = http.Client();
      return client;
    } else {
      return client;
    }
  }

  Future<List> getAllPosts() async {
    try {
      client = initClient();
      String url = 'https://jsonplaceholder.typicode.com/posts';
      http.Response response = await client.get(url);
      String responseBody = response.body;
      List mapList = json.decode(responseBody) as List;
      return mapList;
    } catch (error) {
      print(error);
    }
  }

  getNumberMeaning(int day, int month) async {
    try {
      client = initClient();
      String url =
          'https://numbersapi.p.rapidapi.com/$month/$day/date?fragment=true&json=true';
      http.Response response = await client.get(url, headers: {
        "x-rapidapi-host": "numbersapi.p.rapidapi.com",
        "x-rapidapi-key": "c4d26a6135msh1b9d384f0ea4d05p1d4119jsn7570d462c34b",
      });
      print(response.body);
    } catch (error) {
      print(error);
    }
  }
}
