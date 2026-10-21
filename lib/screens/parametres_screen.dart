
import 'package:flutter/material.dart';
import 'package:ma_biblio/models/livre.dart';

class ParametresScreen extends StatelessWidget {
  const ParametresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView(
  padding: const EdgeInsets.all(8),
  children: [
    ListTile(
      leading: const Icon(Icons.person),
      title: const Text('Mon profil'),
      subtitle: const Text('Nom, e-mail, mot de passe'),
      trailing: const Icon(Icons.chevron_right),
    ),

    const Divider(),

    ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifications'),
    ),

    const Divider(),

    ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Langue'),
      subtitle: const Text('Français'),
    ),

    const Divider(),

    ListTile(
      leading: const Icon(Icons.info),
      title: const Text('À propos'),
      subtitle: const Text('Application MaBiblio'),
      dense: true,
      enabled: false,
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
