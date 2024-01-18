import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookReportScreen extends StatefulWidget {
  @override
  _BookReportScreenState createState() => _BookReportScreenState();
}

class _BookReportScreenState extends State<BookReportScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _bookNames = [];

  @override
  void initState() {
    super.initState();
    _fetchBookNames();
  }

  Future<void> _fetchBookNames() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('books').get();

    setState(() {
      _bookNames = querySnapshot.docs
          .map((doc) => doc['bookName'].toString())
          .toList()
          .cast<String>();
    });
  }

  void _performSearch(String query) {
    // You can implement search logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: _buildBookList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search by book name',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: _performSearch,
    );
  }

  Widget _buildBookList() {
    return ListView.builder(
      itemCount: _bookNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_bookNames[index]),
          // You can add more information about the book if needed
        );
      },
    );
  }
}
