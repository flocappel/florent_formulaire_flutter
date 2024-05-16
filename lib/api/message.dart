// 
 import 'dart:convert';
 import 'package:http/http.dart' as http;
 import '../model/message_model.dart';
 class Message {
  static const String apiUrl = 'https://s3-5002.nuage-peda.fr/messages';
  Future<List<MessageModel>> fetchMessages() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);//Décode le corps de la réponse JSON en une liste dynamique.
      List<MessageModel> messages =
          body.map((dynamic item) => MessageModel.fromJson(item)).toList();
          /*
          Transforme chaque élément de la liste dynamique en 
une instance de MessageModel en utilisant la méthode fromJson, puis convertit le résultat en une 
liste de MessageModel
*/
      return messages;
    } else {
      throw Exception('Failed to load messages');
    }
  }
 }