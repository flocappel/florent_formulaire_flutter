// Ce formulaire va permettre à l’utilisateur de s’inscrire sur le forum.
import 'package:flutter/material.dart';
import 'package:flutter_application_5/api/user.dart';
 class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
 }
 class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _agreeToTerms = false;
  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      //  Vérifie si le formulaire est valide en utilisant les validateurs définis pour chaque champ.
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
              );
  /* Affiche un Dialog avec un CircularProgressIndicator pour indiquer à l'utilisateur que le processus
 de soumission est en cours.
 barrierDismissible: false empêche l'utilisateur de fermer le dialogue en cliquant à l'extérieur.*/
      try {
        print(
            "${_firstNameController.text}, ${_lastNameController.text},${_emailController.text},${_passwordController.text} ");
        int result = await registerUser(
            _firstNameController.text,
            _lastNameController.text,
            _emailController.text,
            _passwordController.text,
            ["user"]);
        Navigator.of(context).pop();
        /*  Les données saisies sont imprimées dans la console pour le débogage.
 La méthode « registerUser » est appelée avec les données du formulaire. Cette méthode enregistre
 l'utilisateur et renvoie un code de résultat.
 Une fois l'inscription terminée, le Dialog avec l'indicateur de progression est fermé
 (Navigator.of(context).pop()) */
        if (result == 201) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Inscription réussie'),
              content: Text(
                  'Bonjour, ${_firstNameController.text} ${_lastNameController.text}!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    Navigator.of(context).pushReplacementNamed('/')
                  },
                ),
              ],
            ),
          );
          /*  Si le résultat est 201, « AlertDialog » s'affiche pour indiquer que l'inscription a réussi.
 Le message de bienvenue contient le prénom et le nom de l'utilisateur.
 Lorsque l'utilisateur appuie sur "OK", « AlertDialog » se ferme et l'utilisateur est redirigé vers la
 page d'accueil (Navigator.of(context).pushReplacementNamed('/')) */
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Échec de l\'inscription'),
              content: Text(
                  'Une erreur est survenue: ${result.toString()}. Veuillez réessayer.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          );
                  }
      }
      /*  Si le résultat n'est pas 201, « AlertDialog » s'affiche pour indiquer que l'inscription a échoué.
 Le message d'erreur contient le code de résultat.
 Lorsque l'utilisateur appuie sur "OK", « AlertDialog » se ferme*/
 catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erreur'),
            content: Text('Erreur lors de l\'inscription: $e'),
            actions: <Widget>[
 TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }
  /*  Si une exception est levée pendant le processus de soumission, « AlertDialog » s'affiche pour
 indiquer qu'une erreur s'est produite.
 Le message d'erreur contient les détails de l'exception.
 Lorsque l'utilisateur appuie sur "OK", le dialogue se ferme*/
  @override
 Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
 TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Color.fromARGB(255, 196, 43, 160)),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
              ),
              validator: (value) {
                if
 (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
 else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Veuillez n\'utiliser que des lettres';
                                  }
                return null;
              },
            ),
            SizedBox(height: 10),
 TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(),
                errorStyle: TextStyle(color: Color.fromARGB(255, 196, 43, 160)),
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 196, 43, 160)),
                ),
              ),
              validator: (value) {
                if
 (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
 else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'Veuillez n\'utiliser que des lettres';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
 TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if
 (value == null || value.isEmpty) {
                  return 'Veuillez entrer un email';
                }
 else if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Veuillez entrer un email valide';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
             TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if
 (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                if
 (value.length < 12) {
                  return 'Le mot de passe doit contenir au moins 12 caractères';
                }
                if
 (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins une minuscule';
                }
                if
 (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins une majuscule';
                }
                if
 (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                  return 'Le mot de passe doit contenir au moins un chiffre';
                }
                if
 (!RegExp(r'(?=.*[\W])').hasMatch(value)) {
                  // \W signifie tout caractère qui n'est pas une lettre ou un chiffre
                  return 'Le mot de passe doit contenir au moins un caractère spécial';
                }
                return null; 
              },
            ),
            SizedBox(height: 10),
 TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirmez le mot de passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if
 (value == null || value.isEmpty) {
                  return 'Veuillez confirmer votre mot de passe';
                }
 else if (value != _passwordController.text) {
                  return 'Les mots de passe ne correspondent pas';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
                        CheckboxListTile(
              title: Text('Accepter les termes et conditions'),
              value: _agreeToTerms,
              onChanged: (bool? newValue) {
                setState(() {
                  _agreeToTerms = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _agreeToTerms ? _submitForm : null,
              child: Center(child: Text('S\'inscrire')),
            ),
          ],
        ),
      ),
    );
  }
 }