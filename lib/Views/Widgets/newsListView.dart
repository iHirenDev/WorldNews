import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/headlinesController.dart';
import 'package:worldnews/Views/newsDetailsView.dart';

class NewsListView extends StatelessWidget {
  //final HeadlinesController newsController = Get.put(HeadlinesController());

  final selectedCategory;

  NewsListView({this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    print('Selected category:$selectedCategory');
    Get.find<HeadlinesController>().category.value = selectedCategory;
    Get.find<HeadlinesController>().news = [];
    Get.find<HeadlinesController>().fetchNews();

    return Container(
        //child: Center(child: Text(selectedCategory)),
        child: Column(
      children: <Widget>[_newsList(context)],
    ));
  }

  Widget _newsList(BuildContext context) {
    return Expanded(
      child: GetBuilder<HeadlinesController>(
        builder: (_) {
          return _.news.length < 1
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _.news.length,
                  itemBuilder: (BuildContext context, int index) {
                    String title = _.news[index].title;
                    String source = _.news[index].source.name;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/news.jpg',
                              image: _.news[index].urlToImage),
                        ),
                        ListTile(
                          title: Text(title),
                          //subtitle: Text(_.news[index].source.name),
                          onTap: () {
                            Get.to(
                                NewsDetails(
                                  newsURL: _.news[index].url,
                                ),
                                transition: Transition.native);
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(width: 16),
                            Text(source),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: RaisedButton.icon(
                                onPressed: () {
                                  Get.find<HeadlinesController>()
                                      .addToReadingList(_.news[index]);
                                },
                                icon: Icon(Icons.archive),
                                label: Text('Save for later'),
                                color: Colors.deepPurple,
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
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
