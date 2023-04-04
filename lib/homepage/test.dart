import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UploadData extends StatefulWidget {
  @override
  _UploadDataState createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _uploadData() async {
    final String title = _titleController.text.trim();
    final String description = _descriptionController.text.trim();

    try {
      await _firestore.collection('books').add({
        'title': title,
        'description': description,
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

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Data to Firestore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Upload Data'),
            ),
          ],
        ),
      ),
    );
  }
}
