import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worldnews/Controllers/Bindings/countriesViewBinding.dart';
import 'package:worldnews/Controllers/Bindings/trendingViewBinding.dart';
import 'package:worldnews/Views/countriesView.dart';
import 'package:worldnews/Views/newsDetailsView.dart';
import 'package:worldnews/Views/trendingview.dart';

import 'Controllers/Bindings/searchViewBinding.dart';
import 'Views/searchView.dart';
import 'Views/worldNews.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
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
          page: () => TrendingView(),
          binding: TrendingViewBinding()),
      GetPage(
          name: '/newsSearchView',
          page: () => SearchView(),
          binding: SearchViewBinding()),
      GetPage(
          name: '/countriesView',
          page: () => Countries(),
          binding: CountriesViewBinding()),
      GetPage(
        name: '/newsDetailsView',
        page: () => NewsDetails(),
      ),
    ],
    //theme: appTheme,
  ));
}
