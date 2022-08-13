import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/news.dart';
import 'news_detail_screen.dart';

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
    // _getAllNews();
  }
//
//   List<News> list_news = [];
//   Future<List<News>> _getAllNews() async {
//     const url =
//         'https://newsapi.org/v2/everything?q=tesla&from=2022-07-12&sortBy=publishedAt&apiKey=950f172b134f472b936a966687c9cc93';
//     final response = await http.get(Uri.parse(url));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       print(response.body);
//
//       var jsonArray = jsonData["articles"].toString();
//
//       // jsonArray.forEach((element) {list_news.add(News(source: element["source"], author: element["author"], title: element["title"], description: element["description"], url: element["url"], urltoImage: element["urlToImage"], publishedAt: element["publishedAt"], content: element["content"]));});
//       // print(jsonArray);
//       // print(jsonArray.length);
//
//       // for (var jsonNews in jsonArray) {
//       //   // print(jsonNews);
//       //   News news = News(
//       //       source: jsonNews['source'],
//       //       author: jsonNews['author'],
//       //       title: jsonNews['title'],
//       //       description: jsonNews['description'],
//       //       url: jsonNews['url'],
//       //       urltoImage: jsonNews['urlToImage'],
//       //       publishedAt: jsonNews['publishedAt'],
//       //       content: jsonNews['content']);
//       //   list_news.add(news);
//       // }
//       print(list_news.length);
//       return list_news;
//     } else {
//       throw Exception("Failed to load News from API");
//     }
//   }

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
        future:
            DefaultAssetBundle.of(context).loadString('assets/article.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());
          return ListView.builder(
              itemCount: newData!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    Container(
                      child: Image.network(
                          newData[index]['urlToImage'].toString()),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                    title: newData[index]['title'].toString(),
                                    urltoImage:
                                        newData[index]['urlToImage'].toString(),
                                    author: newData[index]['author'].toString(),
                                    content:
                                        newData[index]['content'].toString(),
                                    publishedAt: newData[index]['publishedAt']
                                        .toString())));
                      },
                      child: Column(
                        children: [
                          Text(
                            newData[index]['title'],
                            style: TextStyle(
                                fontSize: 20, color: Color(0xfff2f2f2)),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                newData[index]['author'].toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffbababa)),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(newData[index]['publishedAt'].toString(),
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
                );
              });
        },
      ),
    );
  }
}
