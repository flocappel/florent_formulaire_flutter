
// Ecran pour afficher la liste des utilisateurs
import 'package:flutter/material.dart';
import 'package:flutter_application_5/api/user.dart';
import 'package:flutter_application_5/models/user_model.dart';
import 'package:flutter_application_5/api/user.dart';
import 'package:flutter_application_5/models/user_model.dart';

class ListUsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<ListUsersScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des utilisateurs'),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun utilisateur trouvé'));
          } else {
        /*    return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            );
          }*/
          return SingleChildScrollView( // permet le défilement horizontal du tableau
              scrollDirection: Axis.horizontal,
              child: DataTable( // widget pour afficher les données en format tableau.
                columns: const <DataColumn>[ // définit les colonenes
                  DataColumn(label: Text('Prénom')),
                  DataColumn(label: Text('Nom')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Rôles')),
                ],
                rows: snapshot.data!.map((user) {
                  return DataRow( // defini une ligne pour chaque user
                    cells: <DataCell>[ // défini une cellule
                      DataCell(Text(user.firstName.toString())),
                      DataCell(Text(user.lastName)),
                      DataCell(Text(user.email)),
                      DataCell(Text(user.roles.join(', '))), // Affichez les rôles comme une liste séparée par des virgules
                    ],
                 );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}