import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/news.dart';

class Headlines extends StatefulWidget {
  const Headlines({Key? key}) : super(key: key);

  @override
  State<Headlines> createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAllNews();
  }

  Future<List<News>> _getAllNews() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-07-12&sortBy=publishedAt&apiKey=950f172b134f472b936a966687c9cc93';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) 
    {
      var jsonData = jsonDecode(response.body);
      // print(response.body);
      var jsonArray = jsonData['articles'];
      print(jsonArray);
      print(jsonArray.length);
      List<News> list_news = [];
      for (var jsonNews in jsonArray) {
        News news = News(
            source: jsonNews['source'],
            author: jsonNews['author'],
            title: jsonNews['title'],
            description: jsonNews['description'],
            url: jsonNews['url'],
            urltoImage: jsonNews['urlToImage'],
            publishedAt: jsonNews['publishedAt'],
            content: jsonNews['content']);
        list_news.add(news);
      }
      // list_news = list_news.toList();
      return list_news;
    } else {
      throw Exception("Failed to load News from API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff000000),
        title: const Center(
          child: Text(
            'HEADLINES',
            style: TextStyle(
                fontSize: 29,
                color: Color(0xffffffff),
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color(0xff464646),
      body: FutureBuilder<List<News>>(
        future: _getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            List<News> news = snapshot.data!;
            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  News one_news = news[index];
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(news[index].author),
                  );
                });
          }
        },
      ),
    );
  }
}
