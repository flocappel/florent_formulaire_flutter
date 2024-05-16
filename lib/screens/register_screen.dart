 import 'package:flutter/material.dart';
 import 'package:flutter_application_5/widgets/myscaffold.dart';
 import 'package:flutter_application_5/widgets/register_form.dart';
 class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
 }
 class _RegisterScreen extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const MyScaffold(name: 'Register', body: RegisterForm());
  }
 }
 //  L’écran d’inscription est créé avec le Scaffold personnalisé et le formulaire défini précédemment