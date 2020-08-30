import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_api/models/news.dart';
import 'package:wac_api/news_app/providers/wac_news_provider.dart';
import 'package:wac_api/news_app/ui/screens/Wac_News_Home.dart';
import 'package:wac_api/provider/news_provider.dart';
import 'package:wac_api/wac_posts/ui/screens/posts_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WacNewsProvider>(
        create: (BuildContext context) {
          return WacNewsProvider();
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          home: WacNewsHome(),
        ));
  }
}

class NewsHome extends StatelessWidget {
  String content;
  DateTime dateTime = DateTime(2020, 7, 5);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.date_range),
                onPressed: () async {
                  dateTime = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2020, 7, 1),
                    firstDate: DateTime(2000, 7, 7),
                    lastDate: DateTime(2020, 7, 5),
                  );
                }),
            title: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                Provider.of<NewsProvider>(context, listen: false)
                    .getArticles(value, dateTime);
              },
            )),
        body: Consumer<NewsProvider>(
          builder: (BuildContext context, NewsProvider value, Widget child) {
            List<Articles> articlesList = value.articlesList;
            return (articlesList != null)
                ? ListView.builder(
                    itemCount: articlesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.new_releases),
                        title: Text(articlesList[index].title),
                        trailing: Icon(Icons.send),
                      );
                    },
                  )
                : Center(
                    child: Text('No News Yet'),
                  );
          },
        ));
  }
}
