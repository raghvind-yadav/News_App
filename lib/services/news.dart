import 'package:http/http.dart' as http;

class News{
  final Map source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urltoUmage;
  final String publishedAt;
  final String content;
  News({required this.source,required this.author,required this.title,required this.description,required this.url,required this.urltoUmage,required this.publishedAt,required this.content});
}