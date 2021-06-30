import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/gridview/gridview_screen.dart';
import 'package:flutter623calculator/screens/todo_details/todo_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  ToDo todo = ToDo([
    Data(
      id: 1,
      task: "केरा 🍌",
      priority: 1,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an \$100 printer took a galley of type and scrambled it to make a type specimen book. \"It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\" It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://urbanbazaar.com.np/wp-content/uploads/2021/04/transparent-bg-banana-300x225.png",
    ),
    Data(
      id: 2,
      task: "DO mobile work",
      priority: 2,
      description: "Company mobile works",
      reviews: "Very good",
      contact: "94984446545",
      address: "Pokhara, Nepal",
      image:
          "https://urbanbazaar.com.np/wp-content/uploads/2021/05/lime-300x225.jpg",
    ),
    Data(
        id: 3,
        task: "DO hardware work",
        priority: 3,
        description: "Company hardware works",
        reviews: "Very awesome",
        contact: "94988491651121",
        address: "Kathmandu, Nepal",
        image:
            "https://urbanbazaar.com.np/wp-content/uploads/2021/06/malta-orange-500x500-1-300x225.png"),
    Data(
      id: 4,
      task: "DO web work",
      priority: 2,
      description: "Company web works",
      image:
          "https://urbanbazaar.com.np/wp-content/uploads/2021/06/Brahmaputra-Fresh-Colocasia-300x225.jpg",
    ),
    Data(
      id: 1,
      task: "DO software work",
      priority: 1,
      description: "Company software works",
      image:
          "https://urbanbazaar.com.np/wp-content/uploads/2021/05/capsicum-300x225.jpg",
    ),
    Data(
        id: 2,
        task: "DO mobile work",
        priority: 2,
        description: "Company mobile works"),
    Data(
        id: 3,
        task: "DO hardware work",
        priority: 3,
        description: "Company hardware works"),
    Data(
        id: 4,
        task: "DO web work",
        priority: 2,
        description: "Company web works"),
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.separated(
                  separatorBuilder: (context, i) => Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                  shrinkWrap: true,
                  itemCount: todo.data!.length,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.all(
                        10.0,
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => TodoDetailsScreen(
                                data: todo.data![index],
                              ),
                            ),
                          );
                        },
                        title: Text("${todo.data![index].task}"),
                        subtitle: Text(
                          "${todo.data![index].description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        leading: Container(
                          width: 100.0,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              colorFilter: ColorFilter.mode(
                                Colors.black45,
                                BlendMode.darken,
                              ),
                              image: NetworkImage(
                                "${todo.data![index].image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"}",
                                scale: 1.0,
                              ),
                            ),
                          ),

                          // child: Text(
                          //   todo.data![index].priority == 1
                          //       ? "H"
                          //       : todo.data![index].priority == 2
                          //           ? "M"
                          //           : "L",
                          // ),
                        ),
                        trailing: Icon(
                          Icons.arrow_right_alt_outlined,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Container(
            color: Colors.black45,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Column(
              children: [
                Text(
                  "Gridview Builder",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GridViewScreeen(
                                todo: todo,
                              )));
                    },
                    icon: Icon(Icons.grid_goldenratio),
                    label: Text("Gridview Builder"))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => GridViewScreeen(
                    todo: todo,
                  )));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ToDo {
  final List<Data>? data;
  ToDo(this.data);
}

class Data {
  final int? id;
  final String? task;
  final int? priority;
  final String? description;
  final String? reviews;
  final String? contact;
  final String? address;
  final String? image;

  Data({
    this.id,
    this.task,
    this.priority,
    this.description,
    this.reviews,
    this.contact,
    this.address,
    this.image,
  });
}
