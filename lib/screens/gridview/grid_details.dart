import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';

class GridViewDetails extends StatefulWidget {
  const GridViewDetails({Key? key, this.data}) : super(key: key);
  final Data? data;
  @override
  _GridViewDetailsState createState() => _GridViewDetailsState();
}

class _GridViewDetailsState extends State<GridViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data!.task.toString()),
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: [
                Hero(
                  tag: widget.data!.id.toString(),
                  child: ClipOval(
                    child: Image.network(
                      "${widget.data!.image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"}",
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Container(
                  child: Text("${widget.data!.description}"),
                ),
              ],
            ),
          ),
        ));
  }
}
