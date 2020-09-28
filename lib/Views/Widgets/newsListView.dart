
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/headlinesController.dart';
import 'package:worldnews/Views/newsDetailsView.dart';

class NewsListView extends StatelessWidget {
  final HeadlinesController newsController = Get.put(HeadlinesController());

  final selectedCategory;

  NewsListView({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    print('Selected category:$selectedCategory');
    newsController.category.value = selectedCategory;
    newsController.news = [];
    newsController.fetchNews();
    
    return Container(
      //child: Center(child: Text(selectedCategory)),
      child: Column(
        children: <Widget> [
          _newsList(context)
        ],
      )
    );
  }

  Widget _newsList(BuildContext context) {
    return Expanded(
      child: GetBuilder<HeadlinesController>(
        //init: HeadlinesController().getNews(),
        builder: (_) {
          return _.news.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    String title = _.news[index].title;

                    return Column(
                      children: <Widget>[

                        Container(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/news.jpg', 
                            image: _.news[index].urlToImage),
                        ),

                        ListTile(
                          title: Text(title),
                          subtitle: Text(_.news[index].source.name),
                          onTap: () {
                            print(_.news[index].url);
                            Get.to(NewsDetails(

                              newsURL: _.news[index].url,
                            ),
                            transition: Transition.native);
                          },
                        ),
                        SizedBox(height: 10)
                      ],
                    );
                  });
        },
      ),
    );
  }

}