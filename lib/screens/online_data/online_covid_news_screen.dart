import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/controller/news_controller.dart';

import 'package:get/get.dart';

class OnlineNewsApiScreen extends StatelessWidget {
  OnlineNewsApiScreen({Key? key}) : super(key: key);
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid News Api"),
        actions: [
          IconButton(
            onPressed: () {
              newsController.getnewsdata();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Container(
          child: GetBuilder<NewsController>(
            builder: (controller) {
              return newsController.isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: newsController.newsData!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                20.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffe0dede),
                                  blurRadius: 20.0,
                                  spreadRadius: 2.0,
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(
                                  "${newsController.newsData![index].title}"),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${newsController.newsData![index].imageUrl}"),
                              ),
                              subtitle: Text(
                                  "${newsController.newsData![index].summary!.trim()}"),
                              trailing: Text(
                                  "${newsController.newsData![index].createdAt!.year}\n${newsController.newsData![index].createdAt!.month}- ${newsController.newsData![index].createdAt!.day}"),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
