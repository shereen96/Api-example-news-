import 'package:wac_api/news_app/models/news_item.dart';
import 'package:wac_api/news_app/repositories/News_Client.dart';

class NewsRepository {
  NewsRepository._();
  static NewsRepository newsRepository = NewsRepository._();
  Future<List<Articles>> convertJsonToNewsItem(String title) async {
    Map<String, dynamic> map =
        await NewsClient.newsClient.getNewsAboutSomthing(title);
    NewsItem newsItem = NewsItem.fromJson(map);
    List<Articles> articles = newsItem.articles;

    return articles;
  }
}
