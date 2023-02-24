import 'package:flutter/material.dart';

import '../app_screens/button.dart';
import 'inputfield.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: InputFieldLogin(),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Forget Password?",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 40,
          ),
          Button(),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              SizedBox(
                width: 10,
              ),
              Text(
                "Sign up",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
