import 'package:flutter/material.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;

  final Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Informatique': true,
    'Histoire': true,
    'Fantasy': true,
  };

  bool? get _tousLesGenres {
    if (_genres.values.every((genre) => genre)) {
      return true;
    }
    if (_genres.values.every((genre) => !genre)) {
      return false;
    }
    return null;
  }

  IconData _genreIcon(String genre) {
    switch (genre) {
      case 'Science':
        return Icons.science;
      case 'Informatique':
        return Icons.computer;
      case 'Histoire':
        return Icons.history_edu;
      case 'Fantasy':
        return Icons.auto_stories;
      default:
        return Icons.menu_book;
    }
  }

  @override
  Widget build(BuildContext context) {
    final livresFiltres = livres.where((livre) {
      return _genres[livre.genre] == true &&
          (!_nouveautesSeulement || livre.nouveaute);
    }).toList();

    final nombreLus =
        livresFiltres.where((livre) => livre.lu).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lus : $nombreLus / ${livresFiltres.length}'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: const Text('Afficher uniquement les nouveautés'),
            value: _nouveautesSeulement,
            onChanged: (value) {
              setState(() {
                _nouveautesSeulement = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Tous les genres'),
            tristate: true,
            value: _tousLesGenres,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) {
              setState(() {
                _genres.updateAll((genre, _) => value != false);
              });
            },
          ),
          Column(
            children: List.generate(_genres.length, (index) {
              final genre = _genres.keys.elementAt(index);
              final nombreLivres =
                  livres.where((livre) => livre.genre == genre).length;

              return CheckboxListTile(
                title: Text(genre),
                secondary: Icon(_genreIcon(genre)),
                subtitle: Text('$nombreLivres livres'),
                activeColor: Colors.blue,
                value: _genres[genre],
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _genres[genre] = value ?? false;
                  });
                },
              );
            }),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: livresFiltres.length,
              itemBuilder: (context, index) {
                final livre = livresFiltres[index];

                return CheckboxListTile(
                  title: Text(
                    livre.titre,
                    style: TextStyle(
                      decoration: livre.lu
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  value: livre.lu,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      livre.lu = value ?? false;
                    });
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(indent: 72);
              },
            ),
          ),
        ],
      ),
    );
  }
}
