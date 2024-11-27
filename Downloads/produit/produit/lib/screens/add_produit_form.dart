// lib/screens/add_produit_form.dart
import 'package:flutter/material.dart';
import 'package:produit/produit.dart';

class AddProduitForm extends StatefulWidget {
  final Function(Produit) onAddProduit;

  AddProduitForm({required this.onAddProduit});

  @override
  _AddProduitFormState createState() => _AddProduitFormState();
}

class _AddProduitFormState extends State<AddProduitForm> {
  final _formKey = GlobalKey<FormState>();
  final Produit _produit = Produit(
    libelle: '',
    description: '',
    prix: 0.0,
    photo: '',
  );

  String _pickedImagePath = '';

  void _pickImage() async {
    // Utilisez `ImagePicker` pour permettre la sélection d'une image (ou toute autre méthode de votre choix)
    // Exemple : `image_picker` package
    setState(() {
      _pickedImagePath = 'path_to_image';
      _produit.photo = _pickedImagePath;
    });
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onAddProduit(_produit);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un Produit')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Libellé'),
                onSaved: (value) => _produit.libelle = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _produit.description = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Prix'),
                keyboardType: TextInputType.number,
                onSaved: (value) =>
                    _produit.prix = double.parse(value ?? '0'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Choisir une Image'),
              ),
              if (_pickedImagePath.isNotEmpty)
                Image.asset(_pickedImagePath, height: 100),
              Spacer(),
              ElevatedButton(
                onPressed: _saveForm,
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
