Q1.2 : 

Avec onTap : un effet d'encre apparaît brièvement sur le ListTile, et le SnackBar affiche « Profil sélectionné » en bas de l'écran.

Sans onTap : le ListTile n'a plus d'action au clic. L'effet d'encre associé à cette interaction disparaît également, car la ligne n'est plus interactive.

Que se passe-t-il si on supprime onTap ?
- Le clic ne déclenche plus aucune actio

Q1.4 :
dense: true, // Réduit la hauteur du ListTile.
isThreeLine: true, // Prévoit trois lignes de contenu.
enabled: false, // Désactive l'interaction.


Le widget Divider() affiche une ligne horizontale entre les éléments.

 Q2.5 : ListView.builder : permet d'économiser la mémoire et les ressources.

 Q3.1 : StatefulWidget est nécessaire parce que l'état des cases à cocher change. Un StatelessWidget ne gère pas directement cet état.

 Q3.2 : sans setState(), l'interface ne se met pas automatiquement à jour après le changement de variable.

 Q3.5 : ListTileControlAffinity.leading place la case à gauche.

