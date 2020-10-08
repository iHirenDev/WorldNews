import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/newsSearchController.dart';

import 'newsDetailsView.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = Get.put(NewsSearchController());
  bool searching = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: Get.find<NewsSearchController>().txtSearchController,
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  print(query);
                  setState(() {
                    Get.find<NewsSearchController>().searchNews(query);
                    searching = true;
                  });
                } else {
                  setState(() {
                    searching = false;
                    //searchController.news = [];
                  });
                }
              },
              onChanged: (query) {
                if (query.isEmpty) {
                  setState(() {
                    searching = false;
                  });
                }
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Search here for any news'),
            ),
          ),
          searching
              ? _newsList(context)
              : Expanded(
                  child: Center(
                    child: Text(
                      'Type in the search box for news',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget _newsList(BuildContext context) {
    return Expanded(
      child: GetBuilder<NewsSearchController>(
        builder: (_) {
          return _.news.length < 1
              ? Center(
                  //child: CircularProgressIndicator(),
                  child: Text('Search News'),
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
                            Get.to(NewsDetails(
                              newsURL: _.news[index].url,
                            ));
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
