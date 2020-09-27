
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:worldnews/Models/news_model.dart';
import 'package:worldnews/Services/news_api.dart';

class NewsSearchController extends GetxController{
  TextEditingController txtSearchController;
  List<Article> news = List<Article>();

  @override
  void onInit() {
    txtSearchController = TextEditingController();
    super.onInit();
  }

  Future<void> searchNews(String query) async{
    this.news = [];
    update();
    this.news = await NewsAPI().searchNewsFor(query);
    print(news[1].title);
    update();
  }
}