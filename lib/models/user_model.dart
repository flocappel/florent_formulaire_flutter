// Pour garder les utilisateurs
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> roles; // Avec le curl je me suis rappeler qu'on envoyait d'autre info dans user.dart
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    //
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) { // Pour récup les infos user
    return User(
      id: json['id']?? 0,
      firstName: json['first_name'] ?? '', // pour eviter les string null
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      //
      roles: List<String>.from(json['roles'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] ?? '1970-01-01T00:00:00Z'),
      updatedAt: DateTime.parse(json['updatedAt'] ?? '1970-01-01T00:00:00Z'),
    );
  }
}
