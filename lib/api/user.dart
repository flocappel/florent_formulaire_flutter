import 'package:http/http.dart' as http;
 import 'dart:convert';
 import 'package:flutter_application_5/models/user_model.dart';
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

 Future<http.Response> login(String email, String password) async {
  /*  La méthode est déclarée avec un retour de type Future<http.Response>, ce qui signifie qu'elle
 renverra un objet http.Response à un moment futur après l'exécution asynchrone de la méthode.
 Elle prend deux paramètres : email et password, qui sont les informations d'identification de
 l'utilisateur
 */
  final url = Uri.parse('https://s3-5002.nuage-peda.fr/users/login');
  //  L'URL de l'API d'authentification est convertie en un objet Uri en utilisant la méthode Uri.parse.
  final headers = {
    'accept': 'application/json', // indique que la réponse attendue doit être en format JSON
    'Content-Type': 'application/json', //indique que le corps de la requête sera au format JSON
  };
  final body = jsonEncode({
    'email': email,
    'password': password,
  });
  /*  Le corps de la requête est créé en encodant les informations d'identification (email et mot de passe)
      en JSON en utilisant la méthode jsonEncode
  */
  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );
  /*
  La requête POST est envoyée à l'URL spécifiée avec les en-têtes et le corps définis.
 La méthode await est utilisée pour attendre la réponse de l'API
 */
  if (response.statusCode == 200) {
    return response;
  } else {
    throw Exception('Failed to login: ${response.reasonPhrase}');
  }
 }
 /*  Si le code de statut de la réponse est 200, la méthode renvoie l'objet response, indiquant que la
 connexion a réussi.
 Si le code de statut n'est pas 200, une exception est levée avec un message indiquant que la
 connexion a échoué, incluant la raison de l'échec (response.reasonPhrase)
 */

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://s3-5002.nuage-peda.fr/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}