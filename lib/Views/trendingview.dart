import 'package:flutter/material.dart';
import 'package:worldnews/Views/Widgets/newsListView.dart';

class TrendingView extends StatelessWidget {
  //final HeadlinesController newsController = Get.put(HeadlinesController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('WorldNews'),
          // actions: <Widget>[
          //   FlatButton(
          //     textColor: Colors.white,
          //     onPressed: () {
          //       _showBottomSheet();
          //     },
          //     child: Text(Get.find<HeadlinesController>().country.value),
          //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          //   ),
          // ],
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            //indicatorColor: Colors.deepPurple,
            //labelColor: Colors.deepPurple,
            tabs: [
              Tab(
                text: "Trending",
                icon: Icon(Icons.trending_up),
              ),
              Tab(
                text: "Business",
                icon: Icon(Icons.business_center),
              ),
              Tab(
                text: "Sports",
                icon: Icon(Icons.directions_run),
              ),
              Tab(
                text: "Entertainment",
                icon: Icon(Icons.movie),
              ),
              Tab(
                text: "Health",
                icon: Icon(Icons.healing),
              ),
            ],
            onTap: (index){
              print('Selected tab index:$index');
            },
            isScrollable: true,
          ),
        ),
        body: TabBarView(children: [
          //Icon(Icons.trending_up),
          NewsListView(
            selectedCategory: '',
          ),
          NewsListView(
            selectedCategory: 'Business',
          ),
          NewsListView(
            selectedCategory: 'Sports',
          ),
          NewsListView(
            selectedCategory: 'Entertainment',
          ),
          NewsListView(
            selectedCategory: 'Health',
          ),
          // Icon(Icons.business_center),
          // Icon(Icons.local_play),
          // Icon(Icons.movie),
          // Icon(Icons.healing),
        ]),
      ),
    );
  }

 /* _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {
                      Get.find<HeadlinesController>().country.value = 'au',
                      Get.find<HeadlinesController>().fetchNews(),
                      Get.back()
                    }),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {
                Get.find<HeadlinesController>().country.value = 'us',
                Get.find<HeadlinesController>().fetchNews(),
                Get.back()
              },
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }*/
}
