import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'newsDetailsView.dart';

class ArchivedView extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    final readingList = box.read('readingList');
    return Scaffold(
      appBar: AppBar(
        title: Text('Reading List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(

        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: readingList.length,
                itemBuilder: (context, index) {
                  var article = readingList[index];
                  var len = readingList.length;
                  print('Length:$len');
                  print('Articel:$article');
                  //String title = article.title;
                  return Column(
                    children: [
                      Container(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/news.jpg', 
                            image: readingList[index]['urlToImage']),
                        ),
                        
                      ListTile(
                        title: Text(readingList[index]['title']),
                        subtitle: Text(readingList[index]['source']['name']),
                        onTap: (){
                          Get.to(NewsDetails(
                              newsURL: readingList[index]['url'],
                            ),
                            transition: Transition.native);
                        },
                      )
                      ],
                  );
                },
                separatorBuilder: (context, index){
                  return Divider();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
