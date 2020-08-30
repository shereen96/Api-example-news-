import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsListItem extends StatelessWidget {
  String imageUrl;
  String title;
  String auther;
  NewsListItem({this.auther, this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
      title: Text(title),
      subtitle: Text(auther),
      trailing: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {
            print('new has been added to db');
          }),
    );
  }
}
