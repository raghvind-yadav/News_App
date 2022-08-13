import 'dart:ui';

import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  // const NewsDetailScreen({Key? key}) : super(key: key);

  final String title;
  final String urltoImage;
  final String publishedAt;
  final String author;
  final String content;
  NewsDetailScreen(
      {required this.title,
      required this.urltoImage,
      required this.author,
      required this.content,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(urltoImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 29, color: Color(0xfff2f2f2)),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Row(
                    children: [
                      Text(
                        author,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffbababa)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(publishedAt,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffbababa)))
                    ],
                  ),
                  SizedBox(height: 16,),
                  Text(content,style: TextStyle(fontSize: 14,color: Color(0xffbababa)),textAlign: TextAlign.left,)
                ],
              )
            ],
          ),
        ));
  }
}
