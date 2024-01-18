import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libra/screens/login_screen.dart';
import 'package:libra/screens/terms_and_conditions_screen.dart';
import 'package:libra/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    User? user = await _authService.signUp(email, password);
    if (user != null) {
      // Navigate to home screen or another screen
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _signUp,
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen()), // Navigate to login screen
                      );
                    },
                    child: Text('Already have an account? Sign In'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TermsAndConditionsScreen()),
                      );
                      // Navigate to terms and conditions screen
                    },
                    child: Text('Terms and Conditions'),
                  ),
                  // Add other UI components like 'Terms and Conditions', 'Sign In', etc.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
