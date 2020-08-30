import 'package:flutter/material.dart';
import 'package:wac_api/models/news.dart';
import 'package:wac_api/repository/posts_repository.dart';

class NewsProvider extends ChangeNotifier {
  List<Articles> articlesList = [];
  getArticles(String keyWord, DateTime dateTime) async {
    News news =
        await PostsRepository.postsRepository.fetchNews(keyWord, dateTime);
    articlesList = news.articles;
    notifyListeners();
  }
}
