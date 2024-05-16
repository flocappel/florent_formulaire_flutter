import 'package:flutter/material.dart';
 import '../widgets/login_form.dart';
 import '../widgets/myscaffold.dart';
 class LoginScreen extends StatelessWidget {
   @override
 Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Login',
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
 } //  L’écran de connexion appelle le formulaire