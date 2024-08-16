import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You!'),
        backgroundColor: Color(0xFF003B72), // Updated to match your theme
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Your order has been placed successfully!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003B72),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'We appreciate your trust in us. '
                  'Your items will be shipped shortly.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                backgroundColor: Color(0xFF003B72), // Updated to match your theme
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
