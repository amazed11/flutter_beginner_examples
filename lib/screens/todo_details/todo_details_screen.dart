import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';

class TodoDetailsScreen extends StatelessWidget {
  TodoDetailsScreen({Key? key, this.data}) : super(key: key);
  final Data? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data!.task ?? "TODO Data",
        ),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "${data!.image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"}",
              ),
              Text("${data!.description}"),
              Text("${data!.reviews ?? "No Reviews yet"}"),
              Text("${data!.contact ?? "No Contact given"}"),
              Text("${data!.address ?? "No Address mention"}"),
              Text("${data!.priority ?? "NO priority do as your choice"}"),
            ],
          ),
        ),
      ),
    );
  }
}
