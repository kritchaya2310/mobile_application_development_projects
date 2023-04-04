import 'package:flutter/material.dart';

import '../app_screens/button.dart';

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
            // child: InputFieldLogin(),
          ),
          SizedBox(
            height: 40,
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const ForgetPasswordPage()),
          //     );
          //   },
          //   child: Text(
          //     "Forget Password?",
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          SizedBox(
            height: 40,
          ),
          ButtonGoogle(),
          SizedBox(
            height: 30,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Don't have an account?"),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => const SignUpPage()),
          //         );
          //       },
          //       child: Text(
          //         "Sign up",
          //         style: TextStyle(color: Colors.red),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
