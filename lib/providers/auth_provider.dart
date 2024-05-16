 import 'package:flutter/material.dart';
 class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
 }
 /*
 Cette classe AuthProvider utilise le mixin ChangeNotifier pour gérer l'état d'authentification et
 notifier les widgets qui écoutent les changements d'état.
 bool _isLoggedIn = false;
 Cette variable privée « _isLoggedIn » stocke l'état de connexion de l'utilisateur. Par défaut, elle est 
initialisée à false, ce qui signifie que l'utilisateur n'est pas connecté.
 bool get isLoggedIn => _isLoggedIn;
 isLoggedIn permet aux autres parties de l'application de vérifier l'état de connexion de l'utilisateur. 
Il retourne la valeur de _isLoggedIn.
 void login() {
  _isLoggedIn = true;
  notifyListeners();
 }
 La méthode login met à jour _isLoggedIn à true, indiquant que l'utilisateur est maintenant connecté.
 Elle appelle ensuite notifyListeners(), qui est une méthode fournie par ChangeNotifier. Cette
 méthode notifie tous les widgets qui écoutent ce fournisseur que l'état a changé, afin qu'ils puissent
 se reconstruire avec les nouvelles données
  void logout() {
  _isLoggedIn = false;
  notifyListeners();
 }
 La méthode logout met à jour _isLoggedIn à false, indiquant que l'utilisateur est maintenant 
déconnecté.
 Comme dans la méthode login, elle appelle notifyListeners() pour informer les widgets qui écoutent
 ce fournisseur que l'état a changé
 */