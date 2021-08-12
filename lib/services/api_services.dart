import 'dart:io';
import 'package:flutter623calculator/model/product_model.dart';
import 'package:http/http.dart' as http;

class StoreApiServices {
  var client = http.Client();
  Future<dynamic> getProduct() async {
    try {
      var url = Uri.parse("https://fakestoreapi.com/products");
      var response = await client.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      client.close();
    }
  }
}
