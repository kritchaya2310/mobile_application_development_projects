import 'package:flutter/material.dart';

import '../app_screens/button.dart';
import 'header.dart';
import 'inputWrapper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 80,
            // ),
            Header(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputWrapper(),
                    // Expanded(
                    //     child: Container(
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(color: Colors.black, width: 3),
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(60),
                    //       )),
                    //   child: Column(
                    //     children: [
                    //       SizedBox(
                    //         height: 20,
                    //       ),
                    //       Text("or"),
                    //       SizedBox(
                    //         height: 20,
                    //       ),
                    //       ButtonGoogle()
                    //     ],
                    //   ),
                    // ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
