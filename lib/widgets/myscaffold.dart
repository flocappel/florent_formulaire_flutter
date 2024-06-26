// Nous allons définir un Scaffold que nous appellerons dans les écrans de notre application.
 import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';
 import '../providers/auth_provider.dart';
 class MyScaffold extends StatelessWidget {
   /* classe qui hérite de StatelessWidget, indiquant que ce
 widget n'a pas d'état interne qui change au fil du temps.*/
  final Widget body; // contenu principal de MyScaffold.
  final String name; // texte qui sera utilisé comme titre dans l'AppBar
  final List<Widget> actions; // liste optionnelle de widgets (comme des boutons) à afficher dans l'AppBar.
  const MyScaffold(
      {super.key,
      required this.body,
      required this.name,
      this.actions = const []});
  @override
  Widget build(BuildContext context) {
     // Méthode qui décrit comment le widget est construit en utilisant le contexte actuel.
     final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(  // Retourne un widget Scaffold personnalisé :
      appBar: AppBar( // inclut un bouton pour naviguer vers la route « register »
        title: Text(name, style: const TextStyle(color: Colors.white)),
        elevation: 10.0,
        centerTitle: true,
        actions: <Widget>[
          ...actions,
          IconButton(
            icon: const Icon(Icons.list, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/list_users'); // pour la list
            },
          ),
          IconButton(
            icon: const Icon(Icons.app_registration, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/register',
              );
            },
          ),
          /* A voir
        ],
      ),

*/
         IconButton(
            icon: Icon(
              authProvider.isLoggedIn ? Icons.logout : Icons.login,
     color: Colors.white,
            ),
            onPressed: () {
              if (authProvider.isLoggedIn) {
                authProvider.logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (Route<dynamic> route) => false,
                );
              } else {
                Navigator.pushNamed(
                  context,
                  '/login',
                );
              }
            },
          ),
        ],
      ),
//
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: body, 
 // Le corps principal du Scaffold est défini par le widget passé à MyScaffold lors de sacréation.
      floatingActionButton: const FloatingActionButton(
        // Un bouton d'action flottant qui, pour l'instant, n'a pas d'action associée (onPressed est null).
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
 }