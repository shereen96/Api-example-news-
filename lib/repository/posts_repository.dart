import 'package:wac_api/models/news.dart';
import 'package:wac_api/repository/posts_client.dart';

class PostsRepository {
  PostsRepository._();
  static PostsRepository postsRepository = PostsRepository._();
  Future<News> fetchNews(String keyWord, DateTime dateTime) async {
    String date = '${dateTime.year}=${dateTime.month}-${dateTime.day}';
    Map<String, dynamic> map =
        await PostsClient.postsClient.fetchPosts(keyWord, date);
    News news = News.fromJson(map);
    return news;
  }
}
