import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../books_details_page/book_datails_page.dart';

final firestore = FirebaseFirestore.instance;

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('books').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        var books = snapshot.data!.docs;

        return Column(
          children: books.map((book) {
            var bookname = book.get('b_name');
            var description = book.get('b_desc');
            var contact = book.get('b_contact');
            var username = book.get('b_user');

            return Column(
              children: [
                ListTile(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDetailsPage(
                                bookName: bookname,
                                description: description,
                                contact: contact,
                                imageUrl: book.get('b_image_url'),
                                user: username,
                              )),
                    ),
                  },
                  leading: Container(
                    width: 100,
                    height: 200, // increased height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Image.network(
                      book.get('b_image_url'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(bookname),
                  subtitle: Text(book.get('b_user')),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
