import 'package:flutter623calculator/model/product_model.dart';
import 'package:flutter623calculator/screens/online_data/services/api_services.dart';
import 'package:flutter623calculator/services/api_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProduct();
    super.onInit();
  }

  void getProduct() {
    try {
      isLoading(true);
      StoreApiServices().getProduct().then((response) {
        if (response.length > 0) {
          productList.addAll(response);
        }
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
