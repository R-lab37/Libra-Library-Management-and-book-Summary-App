import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookReturnScreen extends StatefulWidget {
  const BookReturnScreen({super.key});

  @override
  _BookReturnScreenState createState() => _BookReturnScreenState();
}

class _BookReturnScreenState extends State<BookReturnScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _standardController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _idCardNoController = TextEditingController();
  TextEditingController _bookNameController = TextEditingController();

  Future<void> _submitBookReturn() async {
    // Validate the input fields (you can add more validation as needed)
    if (_nameController.text.isEmpty ||
        _standardController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _idCardNoController.text.isEmpty ||
        _bookNameController.text.isEmpty) {
      // Show an error message or take appropriate action
      return;
    }

    // Store data in Cloud Firestore
    await FirebaseFirestore.instance.collection('book_returns').add({
      'name': _nameController.text,
      'standard': _standardController.text,
      'date': _dateController.text,
      'idCardNo': _idCardNoController.text,
      'bookName': _bookNameController.text,
    });

    // Clear the input fields after submitting
    _nameController.clear();
    _standardController.clear();
    _dateController.clear();
    _idCardNoController.clear();
    _bookNameController.clear();

    // Show a success message or navigate to another screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _standardController,
              decoration: InputDecoration(labelText: 'Standard'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _idCardNoController,
              decoration: InputDecoration(labelText: 'ID Card No'),
            ),
            TextField(
              controller: _bookNameController,
              decoration: InputDecoration(labelText: 'Book Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitBookReturn,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
