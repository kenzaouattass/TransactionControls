// lib/screens/details_produit.dart
import 'package:flutter/material.dart';
import 'package:produit/produit.dart';

class DetailsProduit extends StatelessWidget {
  final Produit produit;

  DetailsProduit({required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produit.libelle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            produit.photo.isNotEmpty
                ? Image.asset(produit.photo)
                : Placeholder(fallbackHeight: 200),
            SizedBox(height: 16),
            Text('Description: ${produit.description}'),
            SizedBox(height: 8),
            Text('Prix: \$${produit.prix}'),
          ],
        ),
      ),
    );
  }
}
