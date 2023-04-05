import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../homepage/homepage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({
    Key? key,
    required this.bookName,
    required this.description,
    required this.contact,
    required this.imageUrl,
    required this.user,
  }) : super(key: key);

  final String bookName;
  final String description;
  final String contact;
  final String imageUrl;
  final String user;

  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    void _sendNotificationToOwner() {
      String ownerToken =
          "Z3r2SclLIngQfEaBecWOzHZ7K7s1"; // replace with owner's FCM token

      _firebaseMessaging.sendMessage(
        to: ownerToken,
        data: {
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
          "book_name": bookName,
          "message": "Someone confirmed your book!",
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Confirm Book!')));
          _sendNotificationToOwner(); // send notification to owner
        },
        label: Row(
          children: [Icon(Icons.done), Text('Confirm')],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Book's Detail",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[400],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            // margin: EdgeInsets.only(left: 25),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 55, // gap ระหว่าง <- กับ "Detail book"
                ),
              ],
            ),
          ),
          Container(
            width: 412,
            height: 703,
            child: Stack(children: [
              Positioned(
                left: 0,
                top: 180,
                child: Align(
                  child: SizedBox(
                    width: 500,
                    height: 680,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(43),
                        border: Border.all(color: Colors.black, width: 3),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130, // books cover position
                top: 70,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: 140, // กรอบปกหนังสือ
                  height: 215,
                  child: Center(
                    child: SizedBox(
                      width: 140,
                      height: 215,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 305,
                top: 200,
                child: Align(
                  child: SizedBox(
                    width: 55,
                    height: 55,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // position book's name
                left: 116,
                top: 300,
                child: Align(
                  child: SizedBox(
                    width: 800,
                    height: 50,
                    child: Text(
                      bookName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 330,
                child: Align(
                  child: SizedBox(
                    // width: 100,
                    height: 800,
                    child: Text(
                      user,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 380,
                child: Align(
                  child: SizedBox(
                      width: 320,
                      height: 100,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        width: 300,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          description,
                        ),
                      )),
                ),
              ),
              Positioned(
                left: 40,
                top: 500,
                child: Align(
                  child: SizedBox(
                    width: 320,
                    height: 100,
                    child: Container(
                        padding: const EdgeInsets.all(7),
                        width: 300,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(contact)),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
