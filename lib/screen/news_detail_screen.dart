import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  // const NewsDetailScreen({Key? key}) : super(key: key);

  final String title;
  final String urltoImage;
  final String publishedAt;
  final String author;
  final String content;
  NewsDetailScreen({required this.title,required this.urltoImage,required this.author,required this.content,required this.publishedAt});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0x00000000),),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(urltoImage,fit: BoxFit.fill,),
          Text(title,style: TextStyle(fontSize: 29,color: Color(0xfff2f2f2)),),
          SizedBox(height: 64,)
      ]),
    );
  }
}