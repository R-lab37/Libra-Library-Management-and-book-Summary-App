import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PenaltyScreen extends StatefulWidget {
  const PenaltyScreen({super.key});

  @override
  _PenaltyScreenState createState() => _PenaltyScreenState();
}

class _PenaltyScreenState extends State<PenaltyScreen> {
  TextEditingController _studentNameController = TextEditingController();
  TextEditingController _idCardNoController = TextEditingController();
  TextEditingController _penaltyAmountController = TextEditingController();

  Future<void> _submitPenalty() async {
    try {
      // Add penalty data to Firestore
      await FirebaseFirestore.instance.collection('penalties').add({
        'studentName': _studentNameController.text,
        'idCardNo': _idCardNoController.text,
        'penaltyAmount': _penaltyAmountController.text,
        // Add other fields as needed
      });

      // Show a success message or navigate to another screen
      print('Penalty added successfully');
    } catch (e) {
      // Handle errors
      print('Error adding penalty: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _studentNameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextFormField(
              controller: _idCardNoController,
              decoration: InputDecoration(labelText: 'ID Card No'),
            ),
            TextFormField(
              controller: _penaltyAmountController,
              decoration: InputDecoration(labelText: 'Penalty Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitPenalty,
              child: Text('Submit Penalty'),
            ),
          ],
        ),
      ),
    );
  }
}
