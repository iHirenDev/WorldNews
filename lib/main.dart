import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/Bindings/trendingViewBinding.dart';
import 'package:worldnews/Views/Widgets/newsListView.dart';

import 'Controllers/Bindings/searchViewBinding.dart';
import 'Views/searchView.dart';
import 'Views/worldNews.dart';


void main() => runApp(GetMaterialApp(
  home: WorldNews(),
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  getPages: [
    GetPage(
      name: '/',
      page: () => WorldNews(),
    ),
    GetPage(
      name: '/trendingView', 
      page: () => NewsListView(),
      binding: TrendingViewBinding()),
    
    GetPage(
      name: '/newsSearchView', 
      page: () => SearchView(),
      binding: SearchViewBinding()),
  ],
  //theme: appTheme,
));




