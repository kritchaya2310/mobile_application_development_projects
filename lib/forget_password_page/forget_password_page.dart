import 'package:flutter/material.dart';

import '../app_screens/button.dart';
import '../login_page/login_page.dart';
import '../signup_page/email.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Forget password",
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
                InputFieldEmail(),
                SizedBox(
                  height: 50,
                ),
                ButtonForgetPassword()
              ],
            ),
          )),
    );
  }
}
