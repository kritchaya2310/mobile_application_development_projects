import 'package:flutter/material.dart';

// import 'dropdown_category.dart';
import '../app_screens/button.dart';
import '../homepage/homepage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 270,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(child: Text("Help")),
                ),
                SizedBox(
                  height: 70,
                ),
                ButtonSignOut()
              ],
            ),
          )),
    );
  }
}
