import 'package:get/state_manager.dart';
import 'package:worldnews/Models/news_model.dart';
import '../Services/news_api.dart';


class HeadlinesController extends GetxController {
  var newsList = List<Article>().obs;
  List<Article> news = List<Article>();

  var country = 'in'.obs;
  var category = ''.obs;
  var currentIndex = 0.obs;

  Future<void> fetchNews() async {
    this.news = await NewsAPI().fetchTopNewsFor(country.value, category.value);
    //this.newsList.value = await NewsAPI().fetchTopNewsFor(country, category);
    update();
  }

  int changeTabs(int index){
      return index;
  }

  getNews() async{
    NewsAPI().fetchTopNewsFor(country.value,category.value).then((value) {
      this.newsList.value = value;
    });
  }

  @override
  void onInit() {
    fetchNews();
    print("refreshed");
    super.onInit();
  }
}
