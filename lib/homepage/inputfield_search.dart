import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InputFieldSearch extends StatelessWidget {
  const InputFieldSearch(
      {Key? key, required void Function(String query) onChanged})
      : _onChanged = onChanged,
        super(key: key);

  final void Function(String query) _onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: TextField(
        onChanged: _onChanged,
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }

  void searchFirestore(String searchText) {
    FirebaseFirestore.instance
        .collection('books')
        .where('b_name', isGreaterThanOrEqualTo: searchText)
        .where('b_name', isLessThanOrEqualTo: searchText + '\uf8ff')
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Print the document data for each document in the query results
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          print("##########################################################");
          print("♦ Found: ${documentSnapshot.data()}");
          print("##########################################################");
        }
      } else {
        print('No results found');
      }
    });
  }
}
