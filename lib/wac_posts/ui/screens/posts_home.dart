import 'package:flutter/material.dart';
import 'package:wac_api/wac_posts/repositories/post_client.dart';

class PostsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Home'),
      ),
      body: Center(
        child: RaisedButton(onPressed: () {
          PostClient.postClient.getNumberMeaning(16, 5);
        }),
      ),
    );
  }
}
