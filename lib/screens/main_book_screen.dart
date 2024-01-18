import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainBookScreen extends StatefulWidget {
  const MainBookScreen({super.key});

  @override
  _MainBookScreenState createState() => _MainBookScreenState();
}

class _MainBookScreenState extends State<MainBookScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            Expanded(child: _buildBookList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search by book name or author',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: _performSearch,
    );
  }

  Widget _buildBookList(BuildContext context) {
    return StreamBuilder(
      stream: _searchController.text.isEmpty
          ? FirebaseFirestore.instance.collection('books').snapshots()
          : FirebaseFirestore.instance
              .collection('books')
              .where('bookName',
                  isGreaterThanOrEqualTo: _searchController.text.toLowerCase())
              .where('bookName',
                  isLessThan: _searchController.text.toLowerCase() +
                      'z') // Adjust the end range as needed
              .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No books available.'));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            return _buildBookCard(context, snapshot.data!.docs[index]);
          },
        );
      },
    );
  }

  Widget _buildBookCard(BuildContext context, QueryDocumentSnapshot book) {
    return GestureDetector(
      onTap: () {
        _openBookSummary(context, book);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              book['bookName'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              book['authorName'],
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _openBookSummary(BuildContext context, QueryDocumentSnapshot book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookSummaryScreen(book: book),
      ),
    );
    print('Book Summary Clicked: ${book['bookName']}');
  }

  void _performSearch(String query) {
    // Convert the query to lowercase for case-insensitive search
    String lowercaseQuery = query.toLowerCase();

    // Update the Firestore query to include a where clause for bookName or authorName
    Stream<QuerySnapshot> searchResults = FirebaseFirestore.instance
        .collection('books')
        .where('bookName', isGreaterThanOrEqualTo: lowercaseQuery)
        .where('bookName',
            isLessThan: lowercaseQuery + 'z') // Adjust the end range as needed
        .snapshots();

    // You can also print the search query for testing
    print('Search Query: $lowercaseQuery');
  }
}

class BookSummaryScreen extends StatelessWidget {
  final QueryDocumentSnapshot book;

  const BookSummaryScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Summary'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Book Name: ${book['bookName']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Author: ${book['authorName']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Publication: ${book['publication']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Price: ${book['price']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Quantity: ${book['quantity']}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Book Summary: ${book['bookSummary']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
