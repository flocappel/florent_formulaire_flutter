 import 'package:flutter/material.dart';
 import 'package:flutter_application_5/widgets/myscaffold.dart';
 import '../api/message.dart';
 import '../model/message_model.dart';
 class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
 }
 class _HomeScreen extends State<HomeScreen> {
    late Future<List<MessageModel>> futureMessages; //La variable futureMessages est déclarée,mais pas initialisée immédiatement.
  @override
  void initState() {
    super.initState();
     futureMessages = Message().fetchMessages(); //Récupère les messages à partir de l’API
  }
  @override
 Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Home',
      body: FutureBuilder<List<MessageModel>>(
        /* construit l'interface utilisateur en fonction de l'état d'un
 Future qui retourne une liste de MessageModel.
 */
        future: futureMessages, // contient liste des messages
        builder: (context, snapshot) {
          /*
          AsyncSnapshot qui contient l'état actuel du Future et ses données (ou erreur) si
 disponible. L
 e snapshot est utilisé pour gérer différents états de l'opération asynchrone et afficher
 l'interface utilisateur appropriée en fonction de ces états.
 */
          if (snapshot.connectionState == ConnectionState.waiting) {
            /* 
            / Le Future est en cours d'exécution. Un indicateur de progression
 circulaire est affiché pour informer l'utilisateur que les données sont en cours de chargement.
 */
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) { 
            return Center(child: Text('Erreur: ${snapshot.error}')); // Un message d'erreur est affiché à l'utilisateur
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) { 
            // Il n' y a pas de données. || La liste des messages est vide. Un message est affiché pour informer l'utilisateur qu'aucun message n'a été trouvé.
            return Center(child: Text('Aucun message trouvé.'));
          }else {
            List<MessageModel> messages = snapshot.data!;
             // Récupère la liste des messages depuis le snapshot
            return ListView.builder(
                            itemCount: messages.length, // Nombre d'éléments dans la liste
              itemBuilder: (context, index) {
                MessageModel message = messages[index]; // Récupère le message actuel
                return ListTile(
                  title: 
Text(message.subject),
                  subtitle: Text(message.body),
                  onTap: () {
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
 }