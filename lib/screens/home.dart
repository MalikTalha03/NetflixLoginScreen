import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Netflix Login Screen',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
