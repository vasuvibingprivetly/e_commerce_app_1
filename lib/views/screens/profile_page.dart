import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
            ),
            const SizedBox(height: 20),
            const Text(
              'Logan Paul', // Add your name or username
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Boxer', // Add your occupation or description
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality for editing profile
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
