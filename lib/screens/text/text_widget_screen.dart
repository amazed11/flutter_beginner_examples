import 'dart:math';

import 'package:flutter/material.dart';

class TextWidgetScreen extends StatefulWidget {
  const TextWidgetScreen({Key? key}) : super(key: key);

  @override
  _TextWidgetScreenState createState() => _TextWidgetScreenState();
}

class _TextWidgetScreenState extends State<TextWidgetScreen> {
  String? _name = "Ram";
  var isLoading = false;
  List<int> data = [];

  @override
  void initState() {
    listgenerate();
    super.initState();
  }

  Future listgenerate() async {
    await Future.delayed(Duration(seconds: 5));
    final random = Random();
    var data = List.generate(50, (index) => random.nextInt(100));
    setState(() {
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text("Message")),
      body: Center(
        child: data.isEmpty
            ? CircularProgressIndicator()
            : RefreshIndicator(
                onRefresh: listgenerate,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var dataInside = data[index];
                    return buildList(dataInside);
                  },
                ),
              ),
      ),
    );
  }

  buildList(dataInside) => Card(
        child: ListTile(title: Text("$dataInside")),
      );
}
