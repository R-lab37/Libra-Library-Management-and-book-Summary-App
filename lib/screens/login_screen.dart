import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libra/screens/forgot_passowrd_screen.dart';
import 'package:libra/screens/home_screen.dart';
import 'package:libra/screens/signup_screen.dart';
import 'package:libra/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    User? user = await _authService.signIn(email, password);
    if (user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                    onPressed: _signIn,
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                      // Navigate to forgot password screen
                    },
                    child: Text('Forgot Password?'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUpScreen()), // Navigate to sign up screen
                      );
                    },
                    child: Text('Don\'t have an account? Sign Up'),
                  ),
                  // Add other UI components as needed
                  // Add other UI components like 'Forgot Password', 'Sign Up', etc.
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
