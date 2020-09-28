import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:worldnews/Models/news_model.dart';

class NewsAPI{
 final apiKey = 'YOUR API KEY'; 


 Future<List<Article>> fetchTopNewsFor(String country,String category) async{

   final url = 'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey';

   final response = await http.get(url);

  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    
    final news = NewsModel.fromJson(json);
    return news.articles;
  }else{
    throw Exception('Failed to fetch information');
  }
 }

 Future<List<Article>> searchNewsFor(String query) async{
   final url = 'https://newsapi.org/v2/everything?q=$query&apiKey=$apiKey';
   print(url);
   final response = await http.get(url);

  if(response.statusCode == 200){
    final json = jsonDecode(response.body);
    
    final news = NewsModel.fromJson(json);
    return news.articles;
  }else{
    throw Exception('Failed to fetch information');
  }
 }
}