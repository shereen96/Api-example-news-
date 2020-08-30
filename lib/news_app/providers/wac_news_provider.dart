import 'package:flutter/material.dart';
import 'package:wac_api/news_app/models/news_item.dart';
import 'package:wac_api/news_app/repositories/News_Repository.dart';

class WacNewsProvider extends ChangeNotifier {
  List<Articles> articles = [];
  String details;

  setDetails(String details) {
    this.details = details;
    notifyListeners();
  }

  Future<List<Articles>> getNews(String title) async {
    articles = await NewsRepository.newsRepository.convertJsonToNewsItem(title);

    notifyListeners();
  }
}
