import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              'Terms and Conditions of Young Blood Ecommerce',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Your terms and conditions content here'),
            ),
          ),
        ],
      ),
    );
  }
}
