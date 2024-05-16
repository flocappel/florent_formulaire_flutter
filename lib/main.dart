import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/home_screen.dart';
import 'package:flutter_application_5/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
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
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
 }
 //  Création d’une route vers l’écran d’inscription