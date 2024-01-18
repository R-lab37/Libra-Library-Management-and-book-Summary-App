import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentReportScreen extends StatefulWidget {
  @override
  _StudentReportScreenState createState() => _StudentReportScreenState();
}

class _StudentReportScreenState extends State<StudentReportScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _studentsData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search a Student by name or ID number',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
                onChanged: _performSearch,
              ),
            ),
            FutureBuilder(
              future: _fetchStudentsData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return _buildDataTable();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchStudentsData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('students').get();

    _studentsData = querySnapshot.docs
        .map((doc) => doc.data())
        .toList()
        .cast<Map<String, dynamic>>();
  }

  void _performSearch(String query) {
    setState(() {
      _studentsData = _studentsData.where((student) {
        final id = student['id'].toString().toLowerCase();
        final name = student['studentName'].toString().toLowerCase();
        final lowercaseQuery = query.toLowerCase();

        return id.contains(lowercaseQuery) || name.contains(lowercaseQuery);
      }).toList();
    });
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'ID Card Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Pin Code',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Mobile Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Add other columns as needed
        ],
        rows: _studentsData
            .map((student) => DataRow(
                  cells: [
                    DataCell(Text(student['studentName'].toString())),
                    DataCell(Text(student['idCardNo'].toString())),
                    DataCell(Text(student['pinCode'].toString())),
                    DataCell(Text(student['mobileNo'].toString())),
                    DataCell(Text(student['address'].toString())),
                    // Add other cells as needed
                  ],
                ))
            .toList(),
      ),
    );
  }
}
