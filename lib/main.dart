import 'package:flutter/material.dart';
import 'package:libra/screens/login_screen.dart';
import 'package:libra/screens/splashscreen.dart'; // Import the SplashScreen
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyA3p4qbKh2tWRlSNwJad15-cJTgBysgGVs",
    projectId: "libra-9f5eb",
    storageBucket: "libra-9f5eb.appspot.com",
    messagingSenderId: "15601477161",
    appId: "1:15601477161:web:fbac97f33f2cc1d01e9e38",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Libra: Just Read It,Learn It', // 5-letter branding name
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(), // Replace with your Login screen
        // Add other routes as needed
      },
      home: const SplashScreen(), // Navigate to SplashScreen first
    );
  }
}
