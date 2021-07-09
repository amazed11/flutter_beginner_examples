import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/controller/weather_controller.dart';
import 'package:get/get.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({Key? key}) : super(key: key);
  final WeatherController weatherController = Get.put(WeatherController());
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "ENter any city"),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  print(controller.text);
                  weatherController.getData(controller.text);
                },
                icon: Icon(Icons.remove_red_eye),
                label: Text("Fetch")),
            Obx(() => Expanded(
                  child: weatherController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          child: Column(
                            children: [
                              Text(
                                  "${weatherController.weatherData.value.name}"),
                              Text(
                                  "${weatherController.weatherData.value.weather![0].main}"),
                              Text(
                                  "${weatherController.weatherData.value.weather![0].description}"),
                            ],
                          ),
                        ),
                )),
          ],
        ),
      ),
    );
  }
}
