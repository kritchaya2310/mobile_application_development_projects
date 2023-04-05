import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../homepage/homepage.dart';

class BookDetailsPage extends StatelessWidget {
  BookDetailsPage(
      {Key? key,
      required this.bookName,
      required this.description,
      required this.contact,
      required this.imageUrl,
      required this.user,
      required this.path})
      : super(key: key);

  final String bookName;
  final String description;
  final String contact;
  final String imageUrl;
  final String user;
  final String path;

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final documentRef = firestore.collection('books').doc('documentId');

    deletedata(BuildContext context) async {
      // Show a dialog box to confirm whether the user wants to delete the data or not
      bool confirmDelete = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete this book?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );

      // If the user confirms the delete operation, then proceed to delete the data
      if (confirmDelete == true) {
        await FirebaseFirestore.instance
            .collection('books')
            .doc(path) // use the bookName as the document ID
            .delete();
      }
    }

    bool checkUser() {
      String? userEmail = FirebaseAuth.instance.currentUser?.email;
      return userEmail == user;
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Confirm Book!')));
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
          backgroundColor: Colors.blue[400], // Change to transparent
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
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              // Add a BackdropFilter to blur the background
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 0),
              child: Container(
                color: Colors
                    .transparent, // Change the background color with opacity
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    border: Border.all(
                                        color: Colors.black, width: 3),
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
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
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
                          Visibility(
                            visible: checkUser(),
                            child: Positioned(
                              left: 305,
                              top: 200,
                              child: Align(
                                child: SizedBox(
                                  width: 55,
                                  height: 55,
                                  child: InkWell(
                                    onTap: () => {
                                      deletedata(context),
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text('Unlisted book...')),
                                      )
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          border: Border.all(
                                              color: Colors.black, width: 3),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(60))),
                                      child: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   left: 305,
                          //   top: 200,
                          //   child: Align(
                          //     child: SizedBox(
                          //       width: 55,
                          //       height: 55,
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //             color: Colors.redAccent,
                          //             border: Border.all(
                          //                 color: Colors.black, width: 3),
                          //             borderRadius: BorderRadius.all(
                          //                 Radius.circular(60))),
                          //         child: Icon(
                          //           Icons.bookmark,
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            // position book's name
                            left: 120,
                            top: 300,
                            child: Align(
                              child: SizedBox(
                                width: 800,
                                height: 50,
                                child: Text(
                                  bookName,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                            left: 45,
                            top: 360,
                            child: Align(
                              child: SizedBox(
                                // width: 100,
                                height: 800,
                                child: Text(
                                  "Description:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                    padding: const EdgeInsets.all(10),
                                    width: 300,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Text(
                                      description,
                                    ),
                                  )),
                            ),
                          ),
                          Positioned(
                            left: 45,
                            top: 500,
                            child: Align(
                              child: SizedBox(
                                // width: 100,
                                height: 800,
                                child: Text(
                                  "Contact:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            top: 520,
                            child: Align(
                              child: SizedBox(
                                width: 320,
                                height: 80,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 300,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.black, width: 3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Text(contact)),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ]),
              ),
            )));
  }
}
