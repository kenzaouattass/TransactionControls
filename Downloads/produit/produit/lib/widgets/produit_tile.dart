// lib/widgets/produit_tile.dart
import 'package:flutter/material.dart';
import 'package:produit/produit.dart';

class ProduitTile extends StatelessWidget {
  final Produit produit;
  final VoidCallback onTap;

  ProduitTile({required this.produit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: produit.photo.isNotEmpty
          ? Image.asset(produit.photo, width: 50, height: 50)
          : null,
      title: Text(produit.libelle),
      onTap: onTap,
    );
  }
}
