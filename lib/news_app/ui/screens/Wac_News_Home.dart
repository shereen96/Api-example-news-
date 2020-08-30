import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_api/news_app/models/news_item.dart';

import 'package:wac_api/news_app/providers/wac_news_provider.dart';
import 'package:wac_api/news_app/repositories/News_Repository.dart';
import 'package:wac_api/news_app/ui/widgets/News_List_Ite.dart';

class WacNewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('News Home'),
        ),
        body: Column(
          children: <Widget>[
            // RaisedButton(
            //   onPressed: () {
            //     Provider.of<WacNewsProvider>(context, listen: false)
            //         .getNews('gaza');
            //   },
            // ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'news title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                Provider.of<WacNewsProvider>(context, listen: false)
                    .getNews(value);
              },
            ),
            Expanded(child: Consumer<WacNewsProvider>(
              builder: (context, value, child) {
                List<Articles> list = value.articles;

                return list != null
                    ? ListView.separated(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return NewsListItem(
                            auther: list[index].author,
                            imageUrl: list[index].urlToImage,
                            title: list[index].title,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            thickness: 20,
                          );
                        },
                      )
                    : Center(child: Text('No News Found'));
              },
            ))
          ],
        ));
  }
}
