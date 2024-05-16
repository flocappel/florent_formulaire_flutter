 import 'package:flutter/material.dart';
 import 'package:flutter_application_5/utils/flutter_secure_storage.dart';
 import '../api/user.dart';
 import 'package:provider/provider.dart';
 import '../providers/auth_provider.dart';
 
 class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
 }
 class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();
    _loadCredentials();
      }
  Future<void> _loadCredentials() async {
    final credentials = await secureStorage.readCredentials();
    setState(() {
      _emailController.text = credentials['email'] ?? '';
      _passwordController.text = credentials['password'] ?? '';
    });
    /*
     Cette méthode lit les identifiants sauvegardés et met à jour les valeurs des contrôleurs
 _emailController et _passwordController en conséquence
 */
  }
  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await login(_emailController.text, _passwordController.text);
      await secureStorage.saveCredentials(
          _emailController.text, _passwordController.text);
          Provider.of<AuthProvider>(context, listen: false).login();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentification réussie')),
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/');
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Echec de l\'authentification $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  /*
  setState est utilisé pour mettre à jour l'état de la variable _isLoading à true.
 Déclenche une reconstruction de l'interface utilisateur pour afficher un indicateur de chargement,
 indiquant que le processus de connexion est en cours.
 await login(_emailController.text, _passwordController.text) envoie une requête pour authentifier
 l'utilisateur avec les informations saisies (email et mot de passe).
 await attend la réponse avant de continuer l'exécution await secureStorage.saveCredentials(_emailController.text, _passwordController.text) sauvegarde
 les informations de connexion de l'utilisateur de manière sécurisée.
 Cela permet de pré-remplir les champs de texte lors des connexions futures.
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Authentification réussie')))
 affiche un message de succès à l'utilisateur via une barre de notification.
 Future.delayed(Duration(seconds: 2), () { Navigator.pushReplacementNamed(context, '/'); })
 introduit un délai de 2 secondes avant de rediriger l'utilisateur vers la page d'accueil en utilisant
 Navigator.pushReplacementNamed. Cela remplace la page actuelle dans la pile de navigation.
 setState(() { _isLoading = false; }) met à jour l'état pour indiquer que le processus de connexion est
 terminé, ce qui fait disparaitre l'indicateur de chargement
 */
  @override
 Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
 TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
                       if
 (value == null || value.isEmpty) {
                return 'Entrez votre email';
              }
              return null;
            },
          ),
 TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if
 (value == null || value.isEmpty) {
                return 'Entrez votre mot de passe';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          _isLoading
              ?CircularProgressIndicator()
              :ElevatedButton(onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _login();
                    }
                  },
                   child: Text('Login'),
                ),
        ],
      ),
    );
  }
 
                 
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 }
 /*
  _formKey : Clé globale pour identifier le formulaire, utilisée pour la validation et la gestion de l'état
 du formulaire.
 _emailController et _passwordController : Contrôleurs pour gérer les valeurs des champs de texte
 (email et mot de passe).
 _isLoading : Indicateur de chargement pour montrer si une opération est en cours.
 secureStorage : Instance de SecureStorage 
 */

/*
Provider.of<AuthProvider>(context, listen: false) : Récupère l'instance de AuthProvider sans
 s'inscrire aux notifications de changement d'état.
 .login() : Appelle la méthode login de AuthProvider, qui met à jour l'état d'authentification.
 listen: false, le widget actuel ne se reconstruit pas si l'état de AuthProvider change, ce qui est utile
 pour des actions ponctuelles comme l'authentification de l'utilisateur. En effet, on se redirige sur une
 autre page
 */