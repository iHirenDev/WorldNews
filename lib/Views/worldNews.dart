

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/headlinesController.dart';

import 'countriesView.dart';
import 'searchView.dart';
import 'trendingview.dart';

class WorldNews extends StatefulWidget {

  @override
  _WorldNewsState createState() => _WorldNewsState();
}

class _WorldNewsState extends State<WorldNews> {

  final HeadlinesController controller = Get.put(HeadlinesController());

  int _currentIndex = 0;

  final tabPages = [
    Center(child:TrendingView()),
    Center(child:SearchView()),
    Center(child:Countries()),
   // Center(child:TestView())
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Text("WorldNews"),
      //   centerTitle: true,
      //   backgroundColor: Colors.deepPurple,
      // ),
      body: tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            title: Text("Trending"),
            backgroundColor: Colors.deepPurple
            ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            backgroundColor: Colors.deepPurple
            ),


          BottomNavigationBarItem(
            icon: Icon(AntDesign.earth),
            title: Text("World"),
            backgroundColor: Colors.deepPurple
            ),
          
          // BottomNavigationBarItem(
          //   icon: Icon(AntDesign.book),
          //   title: Text("Reading"),
          //   backgroundColor: Colors.deepPurple
          //   ),
        ],
        onTap: (index) => changeTabs(index),
        ),
    );
  }

  void changeTabs(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}