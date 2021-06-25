import 'package:flutter/material.dart';
import 'package:flutter623calculator/screens/todo/todo_screen.dart';
import 'package:flutter623calculator/widgets/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Login App",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(
                15.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCustomTextField(
                    hinttext: "Enter username",
                    icon: Icons.person,
                    controller: usernameEditingController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildCustomTextField(
                    hinttext: "Enter password",
                    icon: Icons.lock,
                    obscuretext: true,
                    controller: passwordEditingController,
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.0,
                      ),
                    ),
                    onPressed: () {
                      if (usernameEditingController.text == "ram" &&
                          passwordEditingController.text == "12345") {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => TodoScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text(
                              "Wrong crendentials",
                            ),
                            content: Text(
                              "Please check your username or password",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ok"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
