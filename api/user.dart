import 'package:http/http.dart' as http;
 import 'dart:convert';
 Future<int> registerUser(String firstName, String lastName, String email,
    String password, List<String> roles) async {
  var url = Uri.parse('https://s3-5002.nuage-peda.fr/users');  
// L'URL du serveur où les données de l'utilisateur seront envoyées.
 
  var headers = {'Content-Type': 'application/json'};
   // Définition des entêtes de la requête HTTP, spécifiant que le contenu sera du JSON.
  var body = json.encode({
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'roles': roles
  });
  // Encodage des données de l'utilisateur en format JSON. Les données incluent le prénom, le nom, l'email, le mot de passe, et les rôles.
  try {
    var response = await http.post(url, headers: headers, body: body); 
    // L'utilisation de await indique que le code attendra ici jusqu'à ce que la réponse du serveur soit reçue.
    if (response.statusCode == 201) { // Si le code de statut est 201, le compte est créé. 
      return response.statusCode;
    } else {
      print(
          "Échec de la requête : Code de statut ${response.statusCode}, Réponse : ${response.body}");
      return response.statusCode;
    }
  } catch (e) {
    print("Exception lors de la requête : $e");
       return 0;
       /*  Un bloc try-catch est utilisé pour gérer les erreurs potentielles lors de l'envoi de la requête (par
 exemple, problème de réseau ou de configuration). Si une exception est capturée, un message
 d'erreur est affiché et la fonction retourne 0. */
  }
 }
 /* Cette fonction retourne un Future<int> indiquant que le résultat sera disponible dans le futur, et il
 s'agira d'un entier. */