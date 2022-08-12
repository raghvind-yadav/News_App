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

  Future<List<News>> getAllNews() async {
    const url = 'https://newsapi.org/v2/everything?q=tesla&from=2022-07-12&sortBy=publishedAt&apiKey=950f172b134f472b936a966687c9cc93';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    var jsonArray = jsonData['articles'];

    List<News> newss = [];
    for (var jsonNews in jsonArray){
      News news = News(source: jsonNews['source'], author: jsonNews['author'], title: jsonNews['title'], description: jsonNews['description'], url: jsonNews['url'], urltoUmage: jsonNews['urlToImage'], publishedAt: jsonNews['publishedAt'], content: jsonNews['content']);
      newss.add(news);
    }
    return newss;
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
                fontWeight: FontWeight.bold
                ),
          ),
        ),
      ),
      backgroundColor: Color(0xff464646),
      // body: ,
    );
  }
}
