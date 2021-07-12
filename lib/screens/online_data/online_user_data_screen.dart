import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/online_data/controller/user_controller.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';
import 'package:get/get.dart';

class OnlineUser extends StatelessWidget {
  OnlineUser({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController());
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: (data) {
                  userController.query.value = data;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffix: searchController.text.length > 0
                      ? IconButton(onPressed: () {}, icon: Icon(Icons.clear))
                      : Icon(Icons.search_off),
                ),
              ),
              Expanded(
                child: Container(
                  height: Get.height * 0.70,
                  child: Obx(
                    () => userController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : userController.lstSearchdata.length <= 0
                            ? Center(child: Text("No search data yet"))
                            : ListView.builder(
                                itemCount:
                                    userController.lstSearchdata.isNotEmpty
                                        ? userController.lstSearchdata.length
                                        : userController.lstUser.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                    title: Text(
                                        "${userController.lstSearchdata.isNotEmpty ? userController.lstSearchdata[index].name : userController.lstUser[index].name}"),
                                    subtitle: Text(
                                        "${userController.lstSearchdata.isNotEmpty ? userController.lstSearchdata[index].address?.street : userController.lstUser[index].address?.street}"),
                                    trailing: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.call),
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
