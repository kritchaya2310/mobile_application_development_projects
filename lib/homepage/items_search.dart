import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../books_details_page/book_datails_page.dart';

final firestore = FirebaseFirestore.instance;

class ItemSearch extends StatelessWidget {
  const ItemSearch({
    Key? key,
    required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('books').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SingleChildScrollView(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('Loading...'),
              ],
            )),
          );
        }

        // Filter the books based on the search query
        var books = snapshot.data!.docs
            .where((book) =>
                book.get('b_name').toLowerCase().contains(query.toLowerCase()))
            .toList();

        return books.isEmpty
            ? SingleChildScrollView(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('No results found'),
                    Lottie.network(
                        'https://assets8.lottiefiles.com/private_files/lf30_e3pteeho.json')
                  ],
                )),
              )
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  var book = books[index];
                  var bookname = book.get('b_name');
                  var description = book.get('b_desc');
                  var contact = book.get('b_contact');
                  var username = book.get('b_user');
                  var path = book.get('b_docs_path');

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
                                path: path,
                              ),
                            ),
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
                },
              );
      },
    );
  }
}
