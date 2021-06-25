import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  ToDo todo = ToDo([
    Data(
        id: 1,
        task: "DO software work",
        priority: 1,
        description: "Company software works"),
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
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Screen"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: todo.data!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(
                  10.0,
                ),
                child: Card(
                  elevation: 15.0,
                  child: ListTile(
                    title: Text("${todo.data![index].task}"),
                    subtitle: Text("${todo.data![index].description}"),
                    leading: CircleAvatar(
                      backgroundColor: todo.data![index].priority == 1
                          ? Colors.red
                          : todo.data![index].priority == 2
                              ? Colors.orange
                              : Colors.black,
                      child: Text(
                        todo.data![index].priority == 1
                            ? "H"
                            : todo.data![index].priority == 2
                                ? "M"
                                : "L",
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_right_alt_outlined,
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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

  Data({this.id, this.task, this.priority, this.description});
}
