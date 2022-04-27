import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/workstation/schema/workstation_profil_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class WorkstationProfilState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// stream all
  Stream<List<WorkstationProfilSchema>> streamAllWorkstation(String idProfil) {
    return _firestore.streamCol(
      path: FirestorePath.workstations(idProfil),
      builder: (data, documentId) => WorkstationProfilSchema.formMap(
        data,
        documentId,
      ),
    );
  }

  /// stream one
  Stream<WorkstationProfilSchema> streamOneWorkstationWithId(
    String idProfil,
    String idWorkstation,
  ) {
    return _firestore.streamDoc(
      path: FirestorePath.workstation(idProfil, idWorkstation),
      builder: (data, documentId) => WorkstationProfilSchema.formMap(
        data,
        documentId,
      ),
    );
  }

  /// add
  Future<void> addWorkstation(
    String idProfil,
    WorkstationProfilSchema newWorkstation,
  ) async {
    await _firestore.add(
      path: FirestorePath.workstations(idProfil),
      data: newWorkstation.toMap(),
    );
  }

  /// update
  Future<void> updateWorkstation(
    String idProfil,
    String idWorkstation,
    WorkstationProfilSchema newWorkstation,
  ) async {
    await _firestore.update(
      path: FirestorePath.workstation(idProfil, idWorkstation),
      data: newWorkstation.toMap(),
    );
  }

  /// delete
  Future<void> deleteWorkstation(
    String idProfil,
    String idWorkstation,
  ) async {
    await _firestore.delete(
      path: FirestorePath.workstation(
        idProfil,
        idWorkstation,
      ),
    );
  }
}
