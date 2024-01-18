import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewBookScreen extends StatefulWidget {
  @override
  _AddNewBookScreenState createState() => _AddNewBookScreenState();
}

class _AddNewBookScreenState extends State<AddNewBookScreen> {
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _authorNameController = TextEditingController();
  TextEditingController _publicationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _bookSummaryController = TextEditingController();

  Future<void> _uploadData() async {
    try {
      // Add book data to Firestore
      await FirebaseFirestore.instance.collection('books').add({
        'bookName': _bookNameController.text,
        'authorName': _authorNameController.text,
        'publication': _publicationController.text,
        'price': _priceController.text,
        'quantity': _quantityController.text,
        'bookSummary': _bookSummaryController.text,
        // Add other fields as needed
      });

      // Show a success message or navigate to another screen
      print('Book added successfully');
    } catch (e) {
      // Handle errors
      print('Error adding book: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _bookNameController,
              decoration: InputDecoration(labelText: 'Book Name'),
            ),
            TextFormField(
              controller: _authorNameController,
              decoration: InputDecoration(labelText: 'Author Name'),
            ),
            TextFormField(
              controller: _publicationController,
              decoration: InputDecoration(labelText: 'Publication'),
            ),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _bookSummaryController,
              decoration: InputDecoration(labelText: 'Book Summary'),
              maxLines: 4,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
