import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation de Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configuration du fournisseur d'authentification
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  runApp(ProduitsApp());
}

class ProduitsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produits App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}
