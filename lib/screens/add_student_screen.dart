import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController _studentNameController = TextEditingController();
  TextEditingController _standardController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _idCardNoController = TextEditingController();

  Future<void> _uploadData() async {
    try {
      await FirebaseFirestore.instance.collection('students').add({
        'studentName': _studentNameController.text,
        'standard': _standardController.text,
        'mobileNo': _mobileNoController.text,
        'address': _addressController.text,
        'pinCode': _pinCodeController.text,
        'city': _cityController.text,
        'idCardNo': _idCardNoController.text,
        // Add other fields as needed
      });

      // Show a success message or navigate to another screen
      print('Student added successfully');
    } catch (e) {
      // Handle errors
      print('Error adding student: $e');
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
              controller: _studentNameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextFormField(
              controller: _standardController,
              decoration: InputDecoration(labelText: 'Standard'),
            ),
            TextFormField(
              controller: _mobileNoController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
              maxLines: 2,
            ),
            TextFormField(
              controller: _pinCodeController,
              decoration: InputDecoration(labelText: 'Pin Code'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextFormField(
              controller: _idCardNoController,
              decoration: InputDecoration(labelText: 'ID Card Number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
