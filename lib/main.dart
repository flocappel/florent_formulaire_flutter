import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/home_screen.dart';
import 'package:flutter_application_5/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
  void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MainApp(),
    ),
  );
 }
 class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
           ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(), //  Création d’une route vers l’écran d’inscription
         '/login': (context) => LoginScreen(),
      },
    );
  }
 }
 
 /*
  ChangeNotifierProvider est un widget fourni par le package provider. Il permet de gérer et de
 fournir un objet qui implémente ChangeNotifier à l'ensemble de l'application ou à une partie de
 celle-ci.
 ChangeNotifierProvider prend deux paramètres principaux :
 ➢ create : Une fonction qui crée une instance de AuthProvider. Cette instance sera disponible
 pour tous les widgets descendants qui en ont besoin.
 ➢ child : Le widget enfant qui peut accéder au fournisseur. Dans ce cas, MainApp est le
 widget enfant.
 create: (context) => AuthProvider(),
 create est une fonction qui prend le BuildContext comme argument et retourne une nouvelle
 instance de AuthProvider.
 AuthProvider est l'objet qui implémente ChangeNotifier. Il gère l'état de l'authentification dans
 l'application.
 child: MainApp(),
 MainApp est le widget racine de l'application. C'est le widget enfant de ChangeNotifierProvider.
 MainApp et tous ses descendants peuvent accéder à l'instance d'AuthProvider créée par le 
ChangeNotifierProvider en utilisant le contexte
*/