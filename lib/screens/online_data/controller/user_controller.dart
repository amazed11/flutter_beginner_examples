import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/helpers/api_clients.dart';
import 'package:flutter623calculator/screens/online_data/model/user_model.dart';
import 'package:flutter623calculator/screens/online_data/services/api_services.dart';
import 'package:get/get.dart';

//search delegate & debouncing
class UserController extends GetxController {
  var isLoading = false.obs;
  var lstUser = <UserModel>[].obs;
  var lstSearchdata = <UserModel>[];
  var query = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    debounce(query, (value) {
      searchUser(value);
    }, time: Duration(seconds: 1));
    getuser();
    super.onInit();
  }

  void searchUser(var queries) {
    isLoading(true);
    lstSearchdata = lstUser.where((element) {
      var name = element.name!.toLowerCase();
      var data = queries.toLowerCase();
      isLoading(false);
      return name.contains(data);
    }).toList();
  }

  void getuser() {
    isLoading(true);
    try {
      ApiServices.getUser().then((response) {
        if (response!.length > 0) {
          lstUser.addAll(response);
          Get.snackbar("Success", "We are loaded!!",
              backgroundColor: Colors.green, snackPosition: SnackPosition.TOP);
        } else {
          Get.snackbar("Error", "Sorry we couldn't get your data ");
        }
      });
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
