import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text('Last Updated: 12-Dec-2024'),
            SizedBox(height: 16),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'By accessing or using Libra ("the App"), you agree to comply with and be bound by these Terms and Conditions ("Terms"). If you do not agree to these Terms, please do not use the App.',
            ),
            SizedBox(height: 16),
            Text(
              '2. User Accounts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You must be at least 18 years of age to use this App. By using this App and agreeing to these Terms, you represent and warrant that you are at least 18 years of age.',
            ),
            SizedBox(height: 16),
            Text(
              '3. Use of the App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'To access certain features of the App, you may be required to create a user account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account. You agree to notify us immediately of any unauthorized use of your account.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Content and Intellectual Property',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'All content and materials available through the App, including text, graphics, images, and software, are the property of Youth Tech or its licensors and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, or modify any content from the App without our express written consent.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Data Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your use of the App is subject to our Privacy Policy, which governs the collection, use, and disclosure of your personal information. By using the App, you consent to the terms of our Privacy Policy.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Limitation of Liability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'To the fullest extent permitted by applicable law, Libra by Youth Tech shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the App.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Changes to Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to modify or update these Terms at any time without prior notice. Your continued use of the App constitutes acceptance of the revised Terms. Please review the Terms periodically for updates.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Governing Law',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'These Terms shall be governed by and construed in accordance with the laws of Indian Constitution. Any disputes arising out of or in connection with these Terms shall be resolved exclusively in the competent courts of Indian Jurisdiction.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these Terms, please contact us at librahelp@gmail.com.',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
