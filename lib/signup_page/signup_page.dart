import 'package:flutter/material.dart';
import 'package:mobile_application_development_projects/login_page/login_page.dart';
import 'package:mobile_application_development_projects/signup_page/password.dart';
import 'package:mobile_application_development_projects/signup_page/username.dart';

// import 'dropdown_category.dart';
import '../app_screens/button.dart';
import '../homepage/homepage.dart';
import 'email.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
          "Sign Up",
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
                InputFieldUsername(),
                SizedBox(
                  height: 50,
                ),
                InputFieldPassword(),
                SizedBox(
                  height: 50,
                ),
                InputFieldEmail(),
                SizedBox(
                  height: 50,
                ),
                ButtonSignUp()
              ],
            ),
          )),
    );
  }
}
