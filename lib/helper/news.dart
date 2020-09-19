import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=ee1a1fe2997047fe8c3223e3da4defa1";

    var response = await http.get(url);

    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null || element["description"]){
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=ee1a1fe2997047fe8c3223e3da4defa1";

    var response = await http.get(url);

    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null || element["description"]){
          ArticleModel articleModel=ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }
  }
}
