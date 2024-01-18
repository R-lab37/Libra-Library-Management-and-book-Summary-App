import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:libra/screens/add_new_book_screen.dart';
import 'package:libra/screens/add_student_screen.dart';
import 'package:libra/screens/book_report_screen.dart';
import 'package:libra/screens/book_return_screen.dart';
import 'package:libra/screens/main_book_screen.dart';
import 'package:libra/screens/panalty_screen.dart';
import 'package:libra/screens/student_report_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomeState();
}

class _MyHomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    MainBookScreen(),
    AddNewBookScreen(),
    BookReportScreen(),
    AddStudentScreen(),
    StudentReportScreen(),
    PenaltyScreen(),
    BookReturnScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libra'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.book_outlined),
            onPressed: () {
              // Implement action when the book icon is pressed
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('My Library'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 98, 77, 255),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Navigate to Add New Book
                _onItemTapped(0);

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add New Book'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Navigate to Add New Book
                _onItemTapped(1);

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.reviews),
              title: Text('Book Report'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Navigate to My Library
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Add Student'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Navigate to Add Student
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Student Report'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Navigate to Student Report
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Penalty'),
              selected: _selectedIndex == 5,
              onTap: () {
                // Navigate to Penalty
                _onItemTapped(5);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Book Return'),
              selected: _selectedIndex == 6,
              onTap: () {
                // Navigate to Book Return
                _onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut(); // Sign out the user
                  Navigator.pushReplacementNamed(
                      context, '/login'); // Navigate to the login screen
                } catch (e) {
                  print('Error signing out: $e');
                  // Handle sign-out errors
                }
                // Logout and navigate to Login screen
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
    );
  }
}
