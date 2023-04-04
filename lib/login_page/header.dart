import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Image(
            image: AssetImage('images/Goodbook_logo.png'),
          )),
          // SizedBox(
          //   height: 40,
          // )
        ],
      ),
    );
  }
}
