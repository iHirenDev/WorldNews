import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldnews/Controllers/headlinesController.dart';

import 'worldNews.dart';

class Countries extends StatelessWidget {

  //final HeadlinesController controller = Get.put(HeadlinesController());
  final WorldNews worldNews = WorldNews();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Select Countries'),
          backgroundColor: Colors.deepPurple,
        ),
        body: _countriesListView(context)
        );
  }

  Widget _countriesListView(BuildContext context) {

      final listCountries = ['India', 'Australia', 'USA', 'UK',
                            'China', 'Germany', 'Canada', 'Japan'];
      
      final listCountryCodes = ['in', 'au', 'us', 'gb', 'cn', 'de', 'ca', 'jp'];

      return ListView.separated(
        
        itemCount: listCountries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listCountries[index],
                    style: TextStyle(fontSize: 20),),
            
            onTap: (){
              var msg = listCountryCodes[index];
              Get.find<HeadlinesController>().country.value = msg;
              Get.off(WorldNews(),
                      transition: Transition.noTransition);
              /*
              Get.snackbar('WorldNews', msg.toString(), 
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.deepPurple);*/
            },
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
        
      );
    }
}
