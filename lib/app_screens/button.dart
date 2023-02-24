import 'package:flutter/material.dart';

import '../homepage/homepage.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 3),
          primary: Colors.amber,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          // minimumSize: Size(50, 40),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ButtonGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 3),
          primary: Colors.redAccent,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          // minimumSize: Size(100, 40),
        ),
        onPressed: () {},
        child: Text(
          "Sign in with Google",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ButtonConfirmBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 3),
          primary: Colors.redAccent,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          // minimumSize: Size(100, 40),
        ),
        onPressed: () {},
        child: Text(
          "Confirm",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
