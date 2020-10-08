import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worldnews/Models/news_model.dart';
import '../Services/news_api.dart';


class HeadlinesController extends GetxController {
  GetStorage box = GetStorage();
  var readingList = List<Article>().obs;
  List<Article> news = List<Article>();

  var country = 'in'.obs;
  var category = ''.obs;
  var currentIndex = 0.obs;

  Future<void> fetchNews() async {
    this.news = await NewsAPI().fetchTopNewsFor(country.value, category.value);
    //this.newsList.value = await NewsAPI().fetchTopNewsFor(country, category);
    update();
  }

  addToReadingList(Article article){
    this.readingList.add(article);   
    box.write('readingList', this.readingList);                 
  }

  @override
  void onInit() {
    fetchNews();
    print("refreshed");
    super.onInit();
  }
}
