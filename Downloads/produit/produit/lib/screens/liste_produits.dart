// lib/screens/liste_produits.dart
import 'package:flutter/material.dart';
import 'package:produit/produit.dart';
import 'package:produit/screens/add_produit_form.dart';

import 'details_produit.dart';
import '../widgets/produit_tile.dart';

class ListeProduits extends StatefulWidget {
  @override
  _ListeProduitsState createState() => _ListeProduitsState();
}

class _ListeProduitsState extends State<ListeProduits> {
  final List<Produit> _produits = [
    Produit(
      libelle: 'Produit 1',
      description: 'Description du produit 1',
      prix:12.50,
      photo: 'assets/images/produit1.jpg', // chemin de l'image
    ),
    Produit(
      libelle: 'Produit 2',
      description: 'Description du produit 2',
      prix:12.50,
      photo: 'assets/images/produit2.jpg', // chemin de l'image
    ),
    Produit(
      libelle: 'Produit 3',
      description: 'Description du produit 3',
      prix:12.50,
      photo: 'assets/images/produit3.jpg', // chemin de l'image
    ),
  ];

  void _addProduit(Produit produit) {
    setState(() {
      _produits.add(produit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddProduitForm(onAddProduit: _addProduit),
                ),
              );
            },
          ),
        ],
      ),
      body: _produits.isEmpty
          ? Center(
              child: Text('Aucun produit disponible. Ajoutez-en un !'),
            )
          : ListView.builder(
              itemCount: _produits.length,
              itemBuilder: (context, index) {
                return ProduitTile(
                  produit: _produits[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsProduit(produit: _produits[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

