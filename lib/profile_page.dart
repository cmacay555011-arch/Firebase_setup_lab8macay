import 'package:flutter/material.dart';

import 'demo_auth.dart';
import 'login_screen.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  const ProfilePage({super.key, required this.username});

  void logout(BuildContext context) {
    DemoAuth.logout();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // If the user logged in as 'admin', we can show default admin info
    // Otherwise, show the registered user's info
    final isAdmin = username == 'admin';
    
    final displayName = isAdmin ? 'Administrator' : (DemoAuth.registeredFullName ?? 'N/A');
    final displayId = isAdmin ? 'ADMIN-001' : (DemoAuth.registeredStudentId ?? 'N/A');
    final displaySection = isAdmin ? 'Admin Section' : (DemoAuth.registeredSection ?? 'N/A');
    final displayEmail = isAdmin ? 'admin@example.com' : (DemoAuth.registeredEmail ?? 'N/A');

    return Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 16),
          
          // Dynamic Full Name
          Text(
            displayName.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          Text(
            'Logged in as: $username',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.badge, color: Colors.indigo),
                  title: const Text('Student ID'),
                  subtitle: Text(displayId),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.school, color: Colors.indigo),
                  title: const Text('Course and Section'),
                  subtitle: Text(displaySection),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.indigo),
                  title: const Text('Email'),
                  subtitle: Text(displayEmail),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          
          ElevatedButton.icon(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}