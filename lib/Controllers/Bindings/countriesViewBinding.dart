

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:worldnews/Controllers/headlinesController.dart';

class CountriesViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HeadlinesController>(() => HeadlinesController());
  }
}