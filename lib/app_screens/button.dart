import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_application_development_projects/app_screens/send_noti.dart';
import 'package:mobile_application_development_projects/login_page/login_page.dart';
import '../homepage/homepage.dart';

class ButtonLogin extends StatelessWidget {
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

class ButtonGoogle extends StatefulWidget {
  const ButtonGoogle({Key? key}) : super(key: key);

  @override
  _ButtonGoogleState createState() => _ButtonGoogleState();
}

class _ButtonGoogleState extends State<ButtonGoogle> {
  bool _isLoading = false;

  Future<void> googleLogin(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    print("#####################################################");
    print("googleLogin method Called");
    print("#####################################################");

    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context); // Dismiss the loading dialog
        print("#####################################################");
        print("Login Fail...");
        print("#####################################################");

        return;
      }

      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $result");
      print("#####################################################");
      print("♦ DisplayName: ${result.displayName}");
      print("♦ Email: ${result.email}");
      print("♦ ImageUrl: ${result.photoUrl}");
      print("#####################################################");

      // Upload display name to Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var userRef = firestore.collection("users").doc(result.displayName);
      await userRef.set({"displayName": result.displayName});

      Navigator.pop(context); // Dismiss the loading dialog
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SendNoti()),
      );
    } catch (error) {
      print(error);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> logout(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();

    Navigator.pop(context); // Dismiss the loading dialog
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 3),
          primary: Colors.redAccent,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        ),
        onPressed: () {
          googleLogin(context);
        },
        child: _isLoading
            ? const SizedBox.shrink() // Hide button text
            : const Text(
                "Login with Google",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

class ButtonSignUp extends StatelessWidget {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Text(
          "Sign Up",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ButtonSignOut extends StatelessWidget {
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
          logout();
          print("Logout...");
        },
        child: Text(
          "Sign Out",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ButtonForgetPassword extends StatelessWidget {
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: Text(
          "Sent to my email",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
