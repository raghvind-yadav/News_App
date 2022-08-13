import 'dart:convert';
import 'package:flutter/material.dart';
import 'news_detail_screen.dart';
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
    _getAllNews();
  }

  List<News> listNews = [];
  Future<List<News>> _getAllNews() async {
    const url =
        'https://newsapi.org/v2/everything?q=tesla&from=2022-07-13&sortBy=publishedAt&apiKey=8837894f49e941979c5ef2f576440dd4';
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(response.body);

      List<dynamic> jsonNews = jsonData["articles"];
      jsonNews.forEach((newsinfo) {
        listNews.add(News(
            source: newsinfo["source"],
            author: newsinfo["author"],
            title: newsinfo["title"],
            description: newsinfo["description"],
            url: newsinfo["url"],
            urltoImage: newsinfo["urlToImage"],
            publishedAt: newsinfo["publishedAt"],
            content: newsinfo["content"]));
      });

      return listNews;
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
      body: FutureBuilder(
        future: _getAllNews(),
        // DefaultAssetBundle.of(context).loadString('assets/article.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: listNews.length,
                // newData!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewsDetailScreen(
                                    title: listNews[index].title,
                                    // newData[index]['title'].toString(),
                                    urltoImage: listNews[index].urltoImage,
                                    // newData[index]['urlToImage'].toString(),
                                    author: listNews[index].author,
                                    // newData[index]['author'].toString(),
                                    content: listNews[index].content,
                                    // newData[index]['content'].toString(),
                                    publishedAt: listNews[index].publishedAt,
                                    // newData[index]['publishedAt'].toString(),
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        Card(
                          elevation: 10,
                          child: Image.network(
                            listNews[index].urltoImage,
                            // newData[index]['urlToImage'].toString()
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            children: [
                              Text(
                                listNews[index].title,
                                // newData[index]['title'],
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xfff2f2f2)),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Text(
                                    listNews[index].author,
                                    // newData[index]['author'].toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffbababa)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(listNews[index].publishedAt,
                                      // newData[index]['publishedAt'].toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffbababa)))
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
