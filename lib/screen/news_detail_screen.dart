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
        // appBar: AppBar(
        //   backgroundColor: Color(0x00000000),
        // ),

        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urltoImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        // alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 15, right: 15),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(Icons.arrow_back,size: 35,color: Colors.white,),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 5),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 29, color: Color(0xfff2f2f2)),
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 5),
                child: Row(
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
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 5,bottom: 5),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 14, color: Color(0xffbababa)),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
