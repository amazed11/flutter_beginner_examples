import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter623calculator/controllers/product_controller.dart';
import 'package:get/get.dart';

class StoreCartScreen extends StatelessWidget {
  StoreCartScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: Obx(
          () => productController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : productController.productList.length < 0
                  ? Center(
                      child: Text("No data found"),
                    )
                  : ListView.builder(
                      itemCount: productController.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = productController.productList[index];
                        return Card(
                          child: Container(
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    imageUrl: "${data.image}",
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                              title: Text("${data.title}"),
                              subtitle: Column(
                                children: [
                                  Text("Category :.${data.category}"),
                                  Text(
                                    "${data.description}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              trailing: Text("Rs. ${data.price}"),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
