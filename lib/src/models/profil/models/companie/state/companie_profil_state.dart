import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/companie/schema/companie_profil_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class CompanieProfilState extends ChangeNotifier {
  /// instance de firestore
  final _firestore = WooFirestore.instance;

  /// ecoute la companie du profil
  Stream<List<CompanieProfilSchema>> streamCompaniesProfil(String idProfil) {
    return _firestore.streamCol<CompanieProfilSchema>(
      path: FirestorePath.companie(idProfil),
      builder: (data, documentId) =>
          CompanieProfilSchema.formMap(data, documentId),
    );
  }

  /// ajout d'une companie du profil
  Future<DocumentReference<Map<String, dynamic>?>?>? addCompanieProfilOfProfil(
      String idProfil, CompanieProfilSchema newCompanie) async {
    final result = await _firestore.add(
      path: FirestorePath.companie(idProfil),
      data: newCompanie.toMap(),
      returnData: true,
    );

    return result;
  }

  /// update la companie du profil
  Future<void> updateCompanie(String idProfil, String idCompanie,
      CompanieProfilSchema newCompanie) async {
    await _firestore.update(
      path: FirestorePath.companieById(idProfil, idCompanie),
      data: newCompanie.toMap(),
    );
  }

  /// delete la companie du profil
  Future<void> deleteCompanie(String idProfil, String idCompanie) async {
    await _firestore.delete(
      path: FirestorePath.companieById(idProfil, idCompanie),
    );
  }
}
