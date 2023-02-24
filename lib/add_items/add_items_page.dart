import 'package:flutter/material.dart';

// import 'dropdown_category.dart';
import '../app_screens/button.dart';
import 'inputfield_book_contact.dart';
import 'inputfield_book_description.dart';
import 'inputfield_book_name.dart';

class AddItems extends StatelessWidget {
  const AddItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Add book"),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: null,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                )),
            SizedBox(
              height: 40,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  InputFieldBookName(),
                  SizedBox(
                    height: 20,
                  ),
                  InputFieldBookDescription(),
                  SizedBox(
                    height: 20,
                  ),
                  InputFieldBookContact(),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonConfirmBook()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
