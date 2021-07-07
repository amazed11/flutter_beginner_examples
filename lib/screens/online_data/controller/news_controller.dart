import 'package:flutter623calculator/screens/online_data/model/news_model.dart';
import 'package:flutter623calculator/screens/online_data/services/api_services.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  List<NewsData>? newsData = <NewsData>[];
  //List<NewsData>

  var isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    getnewsdata();
    super.onInit();
  }

  void getnewsdata() {
    try {
      isLoading = true;
      ApiServices.getNews().then((response) {
        if (response != null) {
          newsData = response.data;
          isLoading = false;
          update();
        } else {
          isLoading = false;
          newsData = null;
          update();
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
