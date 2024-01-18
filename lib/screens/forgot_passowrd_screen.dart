import 'package:flutter/material.dart';
import '../services/auth_service.dart'; // Import your auth service

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();

  void _resetPassword() async {
    String email = _emailController.text.trim();
    try {
      await _authService.resetPassword(email);
      // Show success message or navigate to login screen
    } catch (e) {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
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
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _resetPassword,
                    child: Text('Reset Password'),
                  ),
                  // Add other UI components as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
