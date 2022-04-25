import 'package:skillz/src/models_shared/index.dart';
import 'package:skillz/src/models_shared/state/schema/state_schema.dart';

class ProfilSchema {
  String? id;
  String firstName;
  String lastName;
  String? idEmployeur;
  RoleSchema role;
  StateSchema state;

  ProfilSchema({
    this.id,
    required this.firstName,
    required this.lastName,
    this.idEmployeur,
    required this.role,
    required this.state,
  });

  factory ProfilSchema.fromMap(Map<String, dynamic> data, documentId) {
    String firstName = data['firstName'];
    String lastName = data['lastName'];
    String idEmployeur = data['idEmployeur'] ?? '';
    RoleSchema role = data['role'] != null
        ? RoleSchema(
            libelle: data['role']['libelle'],
            tag: data['role']['tag'],
          )
        : RoleSchema(libelle: '', tag: '');
    StateSchema state = data['state'] != null
        ? StateSchema(
            libelle: data['state']['libelle'],
            tag: data['state']['tag'],
          )
        : StateSchema(libelle: '', tag: '');

    return ProfilSchema(
      id: documentId,
      firstName: firstName,
      lastName: lastName,
      idEmployeur: idEmployeur,
      role: role,
      state: state,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'idEmployeur': idEmployeur ?? '',
      'role': role.toMap(),
      'state': state.toMap(),
    };
  }
}
