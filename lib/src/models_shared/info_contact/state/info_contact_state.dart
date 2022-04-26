import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/info_contact/schema/info_contact_schema.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class InfoContactState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// get one avec son id
  Future<DocumentSnapshot<Map<String, dynamic>>> getOneInfoContact(
    String idInfoContact,
  ) async {
    final result = await _firestore.getDoc(
      path: path,
    );
    return result;
  }

  /// get one id profil
  Future<List<InfoContactSchema>> getOneInfoContactWithIdProfil(
    String idProfil,
  ) async {
    final result = await _firestore.getCol(
      path: path,
      builder: (data, documentId) =>
          InfoContactSchema.formMap(data, documentId),
      queryBuilder: (query) => query.where('idProfil', isEqualTo: idProfil),
    );
    return result;
  }

  /// add
  Future<InfoContactSchema> addInfoContact(
    InfoContactSchema newInfoContact,
  ) async {}

  /// update avec idProfil
  Future<InfoContactSchema> updateInfoContactWithIdProfil(
    String idProfil,
    InfoContactSchema newInfoContact,
  ) async {}

  /// update avec id
  Future<InfoContactSchema> updateInfoContact(
    String idInfoContact,
    InfoContactSchema newInfoContact,
  ) async {}

  /// delete
  Future<InfoContactSchema> deleteInfoContactWithIdProfil(
    String idProfil,
  ) async {}

  /// delete
  Future<InfoContactSchema> deleteInfoContact(
    String idInfoContact,
  ) async {}
}
