import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

        Column abc() {
          return Column(
            children: [
              for (int i = 1; i <= books.length; i++) ...[Items()],
            ],
          );
        }

        return Column(
          children: books.map((book) {
            var bookname = book.get('b_name');

            return Column(
              children: [
                ListTile(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookDetailsPage()),
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
                      book.get('p_url'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(bookname),
                  // subtitle: Text(book.get('p_seller')), // <-----------------
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

// class ABC extends StatelessWidget {
//   const ABC({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (int i = 1; i <= 1; i++) ...[Items()],
//       ],
//     );
//   }
// }
