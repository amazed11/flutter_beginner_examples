import 'package:flutter623calculator/screens/online_data/helpers/api_clients.dart';
import 'package:flutter623calculator/screens/online_data/model/news_model.dart';
import 'package:flutter623calculator/screens/online_data/model/user_model.dart';
import 'package:flutter623calculator/screens/online_data/model/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  //get post services
  Future getPosts() async {
    try {
      String url = "https://jsonplaceholder.typicode.com/posts";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

//get news api services

  static Future<NewsModel?> getNews() async {
    try {
      var url = Uri.parse("https://corona.askbhunte.com/api/v1/news");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return newsModelFromJson(response.body);
      } else {
        print("sorry we cannot receive data");
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

//weather services api
  static Future<WeatherModel?> getWeather(var city) async {
    try {
      var key = dotenv.env['APP_KEY'];
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return weatherModelFromJson(response.body);
      } else {
        print("sorry we cannot receive data");
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // user fetch services
  static Future<List<UserModel>?> getUser() async {
    try {
      var url = Uri.parse("${ApiClients.baseUrl + ApiClients.users}");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return userModelFromJson(response.body);
      } else {
        print("sorry we cannot receive data");
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
