import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../app_screens/button.dart';
import '../homepage/homepage.dart';
import 'inputfield_book_contact.dart';
import 'inputfield_book_description.dart';
import 'inputfield_book_name.dart';

class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  File? _imageFile;

  Future<void> _uploadPicture() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  final TextEditingController _bNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _uploadData() async {
    final String bookName = _bNameController.text.trim();
    final String description = _descriptionController.text.trim();
    final String contact = _contactController.text.trim();

    try {
      await _firestore.collection('books').add({
        'b_name': bookName,
        'b_desc': description,
        'b_contact': contact,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data uploaded to Firestore')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading data: $e')),
      );
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  @override
  void dispose() {
    _bNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add book",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: _uploadPicture,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile!,
                          fit: BoxFit.fill,
                        )
                      : Icon(
                          Icons.image,
                          size: 50,
                        ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
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
                    TextField(
                      controller: _bNameController,
                      decoration: InputDecoration(hintText: 'Title'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(hintText: 'Description'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _contactController,
                      decoration: InputDecoration(hintText: 'Contact'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(width: 3),
                          primary: Colors.redAccent,
                          onPrimary: Colors.white,
                          shadowColor: Colors.transparent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          // minimumSize: Size(100, 40),
                        ),
                        onPressed: () {
                          _uploadData();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
