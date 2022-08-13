import 'package:http/http.dart' as http;

class News{
  final Map source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urltoImage;
  final String publishedAt;
  final String content;
  News({required this.source,required this.author,required this.title,required this.description,required this.url,required this.urltoImage,required this.publishedAt,required this.content});
  factory News.fromJson(Map<String,dynamic> map){
    return News(
    source: map['source'],
    author: map['author'],
    title : map['title'],
    description: map['description'],
    url: map['author'],
    urltoImage: map['author'],
    publishedAt: map['author'],
    content: map['author']);
  }

}
