import 'package:flutter/material.dart';
import '../models/add_user_response.dart';

class SuccessPage extends StatelessWidget {
  final AddUserResponse addUserResponse;

  const SuccessPage({super.key, required this.addUserResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Success to add user!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Name: ${addUserResponse.name}'),
            Text('Job: ${addUserResponse.job}'),
            Text('ID: ${addUserResponse.id}'),
            Text('Created At: ${addUserResponse.createdAt}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
