import 'dart:math';

import 'package:flutter/material.dart';

class GridViewScreeen extends StatelessWidget {
  GridViewScreeen({Key? key}) : super(key: key);
  var rand = Random();
  var ListofColors = [Colors.red, Colors.blue, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Exaample"),
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
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10.0,
                child: GridTile(
                  header: FlutterLogo(
                    size: 70.0,
                  ),
                  footer: Text("Rs100"),
                  child: Text("data"),
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
              );
            }),
      ),
    );
  }
}
