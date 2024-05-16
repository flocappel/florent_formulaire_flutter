 
 import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  /*
   La classe SecureStorage est déclarée pour encapsuler les opérations de stockage sécurisé.
 _storage est une instance de FlutterSecureStorage.
 _keyEmail et _keyPassword sont des constantes représentant les clés utilisées pour stocker et
 récupérer les valeurs correspondantes (email et mot de passe).
 */
  final _storage = FlutterSecureStorage();
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';
  Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _keyEmail, value: email);
    await _storage.write(key: _keyPassword, value: password);
  }
  /*
  Cette méthode asynchrone prend deux paramètres : email et password.
 Elle utilise la méthode « write » de « _storage » pour stocker l'email et le mot de passe sous les clés
 « _keyEmail » et « _keyPassword ».
 await est utilisé pour attendre la fin de chaque opération d'écriture.
 */
  Future<Map<String, String?>> readCredentials() async {
    String? email = await _storage.read(key: _keyEmail);
    String? password = await _storage.read(key: _keyPassword);
    return {
      'email': email,
      'password': password,
    };
  }
  /*
   Cette méthode asynchrone lit les informations d'identification stockées.
 Elle utilise la méthode « read » de « _storage » pour récupérer les valeurs stockées sous les clés 
« _keyEmail » et « _keyPassword ».
 Les valeurs récupérées (email et password) sont retournées sous forme de map (Map<String, 
String?>)
*/
  Future<void> deleteCredentials() async {
    await _storage.delete(key: _keyEmail);
    await _storage.delete(key: _keyPassword);
  }
 }
 /*
  Cette méthode asynchrone supprime les informations d'identification stockées.
 Elle utilise la méthode « delete » de _storage pour supprimer les valeurs stockées sous les clés 
« _keyEmail » et « _keyPassword ».
 await est utilisé pour attendre la fin de chaque opération de suppression
 */