import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/companie/state/companie_profil_state.dart';
import 'package:skillz/src/models/profil/schema/profil_schema.dart';
import 'package:skillz/src/models_shared/info_contact/state/info_contact_state.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class ProfilState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;
  final _infoContactState = InfoContactState();
  final _companieProfilState = CompanieProfilState();

  /// stream profil de l'utilisateur connecté
  Stream<ProfilSchema> streamProfilCurrent(String uid) {
    final profil = _firestore.streamCol(
        path: FirestorePath.profils(),
        builder: (data, documentId) => ProfilSchema.fromMap(data, documentId),
        queryBuilder: (query) => query.where('uid', isEqualTo: uid));
    return profil.map((event) => event[0]);
  }

  /// recupere tous les profils
  Future<List<ProfilSchema>> getAllProfil() async {
    return await _firestore.getCol(
      path: FirestorePath.profils(),
      builder: (data, documentId) => ProfilSchema.fromMap(data, documentId),
    );
  }

  /// recupere tous les profil qui ont le meme employer
  Future<List<ProfilSchema>> getAllProfilWithIdEmployer(
      String idEmployer) async {
    return await _firestore.getCol(
      path: FirestorePath.profils(),
      builder: (data, documentId) => ProfilSchema.fromMap(data, documentId),
      queryBuilder: (query) => query.where('idEmployer', isEqualTo: idEmployer),
    );
  }

  /// recupere un profil avec son id
  Future<DocumentSnapshot<Map<String, dynamic>>> getOneProfilWithId(
      String idProfil) async {
    return await _firestore.getDoc(
      path: FirestorePath.profil(idProfil),
    );
  }

  /// modifie un profil avec son id
  Future<void> updateProfilWithId(
      String idProfil, ProfilSchema newProfil) async {
    await _firestore.update(
      path: FirestorePath.profil(idProfil),
      data: newProfil.toMap(),
    );
  }

  /// supprime un profil avec son id
  Future<void> deleteProfil(String idProfil, String idCompanie) async {
    /// delete companie
    await _companieProfilState.deleteCompanie(idProfil, idCompanie);

    /// todo delete wallet competence

    /// todo delete all workstation

    /// delete infoContact
    await _infoContactState.deleteInfoContactWithIdProfil(idProfil);

    /// delete profil
    await _firestore.delete(path: FirestorePath.profil(idProfil));
  }
}
