
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:worldnews/Controllers/newsSearchController.dart';

class SearchViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewsSearchController>(() => NewsSearchController());
  }
}