import 'package:wac_api/repository/posts_client.dart';
import 'package:wac_api/wac_posts/models/post.dart';
import 'package:wac_api/wac_posts/repositories/post_client.dart';

class PostRepository {
  PostRepository._();
  static PostRepository postRepository = PostRepository._();
  Future<List<Post>> convertJsonToPost() async {
    List responseList = await PostClient.postClient.getAllPosts();
    List<Post> posts = responseList.map((e) {
      return Post.fromJson(e);
    }).toList();
    print(posts.length);
    print(posts.first.title);
  }
}
