import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/helpers/customdialogs.dart';
import 'package:flutter623calculator/screens/online_data/model/weather_model.dart';
import 'package:flutter623calculator/screens/online_data/services/api_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var weatherData = WeatherModel().obs;
  var isLoading = false.obs;

  void getData(var city) {
    try {
      isLoading.value = true;
      Future.delayed(Duration(seconds: 5), () {
        ApiServices.getWeather(city).then((response) {
          if (response != null) {
            weatherData.value = response;
            Fluttertoast.showToast(
              msg: "Successfully loaded",
              backgroundColor: Colors.amber,
              gravity: ToastGravity.CENTER,
            );
          } else {
            Fluttertoast.showToast(
              msg: "Sorry we couldn't get your data",
            );
          }
        });
      });
      // isLoading(true);

    } catch (e) {
      CustomDialogs().errorDialog();
    } finally {
      isLoading(false);
    }
  }
}
