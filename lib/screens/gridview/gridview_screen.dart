import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';

class GridViewScreeen extends StatelessWidget {
  GridViewScreeen({Key? key, this.todo}) : super(key: key);
  var rand = Random();
  final ToDo? todo;
  var ListofColors = [Colors.red, Colors.blue, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GridView Exaample",
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              child: InkWell(
                onTap: () {
                  print("add to cart");
                },
                child: Container(
                  child: Stack(
                    children: [
                      Icon(Icons.shopping_cart_outlined, size: 35.0),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(
          20.0,
        ),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: todo!.data!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Card(
                  elevation: 10.0,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                            "${todo!.data![index].image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"}"),
                      ),
                      Text("Food"),
                      Text("Price: Rs100"),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart_outlined),
                          label: Text("Add to Cart"))
                    ],
                    // color:
                    //     Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    // child: Column(
                    //   children: [

                    //     // FlutterLogo(
                    //     //   size: 50.0,
                    //     // ),
                    //     // Container(
                    //     //   width: MediaQuery.of(context).size.width * 0.40,
                    //     //   child: Text(
                    //     //     "Flutter Beginners Course Part -1 Flutter Beginners Course Part -1 Flutter Beginners Course Part -1",
                    //     //     overflow: TextOverflow.ellipsis,
                    //     //     style: TextStyle(
                    //     //       color: Colors.white,
                    //     //       fontSize: 15.0,
                    //     //       fontWeight: FontWeight.bold,
                    //     //     ),
                    //     //   ),
                    //     // ),

                    //     // Center(
                    //     //   child: Text(
                    //     //     "\$100",
                    //     //     style: TextStyle(
                    //     //       color: Colors.white,
                    //     //       fontSize: 18.0,
                    //     //       fontWeight: FontWeight.bold,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // Center(
                    //     //   child: Text(
                    //     //     "\$150",
                    //     //     style: TextStyle(
                    //     //       color: Colors.white,
                    //     //       fontSize: 14.0,
                    //     //       fontWeight: FontWeight.bold,
                    //     //       decoration: TextDecoration.lineThrough,
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // Container(
                    //     //   color: Colors.black26,
                    //     //   child: IconButton(
                    //     //     onPressed: () {
                    //     //       print("add to cart success");
                    //     //     },
                    //     //     color: Colors.white,
                    //     //     icon: Icon(Icons.add_shopping_cart_outlined),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
