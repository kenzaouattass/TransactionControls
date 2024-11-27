import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    void _logout() async {
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenue, ${user?.email ?? 'Invité'}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Déconnexion'),
            ),
          ],
        ),
      ),
    );
  }
}
