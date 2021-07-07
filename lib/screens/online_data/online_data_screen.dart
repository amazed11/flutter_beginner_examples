// http method
//get method - to fetch
//post method - to save
//put/patch method -to update
//delete method - to delete

// format should be in json to properly rendered

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OnlinedataScreen extends StatefulWidget {
  const OnlinedataScreen({Key? key}) : super(key: key);

  @override
  _OnlinedataScreenState createState() => _OnlinedataScreenState();
}

class _OnlinedataScreenState extends State<OnlinedataScreen> {
  var isloading = false;
  var apiData;
  Future getPosts() async {
    try {
      isloading = true;
      String url = "https://jsonplaceholder.typicode.com/posts";
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          apiData = json.decode(response.body);
          isloading = false;
        });
      } else {
        setState(() {
          isloading = false;
          apiData = "data not found";
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Data"),
      ),
      body: Container(
        child: Container(
          height: 200.0,
          padding: EdgeInsets.all(
            20.0,
          ),
          child: isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: apiData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150.0,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffe6e5e3),
                              blurRadius: 20.0,
                              spreadRadius: 1.0,
                              offset: Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text("${apiData[index]['title']}"),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
