import 'package:flutter/material.dart';
import 'package:ma_biblio/models/livre.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mon profil'),
            subtitle: Text('Nom, e-mail, mot de passe'),
            trailing:  Icon(Icons.chevron_right),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('Profil sélectionné'),
                ),
              );
            },
          ),
          ListTile(
            leading:Icon(Icons.notifications),
            title:  Text('Notifications'),
            tileColor: Colors.blue.shade50,
            iconColor: Colors.blue,
            textColor: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          ),

          ListTile(
            leading: Icon(Icons.language),
            title:  Text('Langue'),
            subtitle: Text('Français'),
          ),

          ListTile(
            leading:  Icon(Icons.info),
            title:  Text('À propos'),
            dense: true, 
            enabled: false
          ),
        ],
      ),
    );
  }
}
Widget livreTile(Livre livre) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: livre.couleur,
      child: Text(
        livre.titre[0],
        
      ),
    ),
    title: Text(livre.titre),
    subtitle: Text('${livre.auteur} - ${livre.annee}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(livre.note.toString()),
        const SizedBox(width: 4),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ],
    ),
  );
}
