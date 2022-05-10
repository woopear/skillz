import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/info_contact/schema/info_contact_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class InfoContactState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// get one avec son id
  Future<DocumentSnapshot<Map<String, dynamic>>> getOneInfoContact(
    String idInfoContact,
  ) async {
    final result = await _firestore.getDoc(
      path: FirestorePath.infoContact(idInfoContact),
    );
    return result;
  }

  /// get one id profil
  Future<InfoContactSchema?> getOneInfoContactWithIdProfil(
    String idProfil,
  ) async {
    final result = await _firestore.getCol(
      path: FirestorePath.infoContacts(),
      builder: (data, documentId) =>
          InfoContactSchema.formMap(data, documentId),
      queryBuilder: (query) => query.where('idProfil', isEqualTo: idProfil),
    );
    if (result.isNotEmpty) {
      return result[0];
    } else {
      return null;
    }
  }

  /// add
  Future<DocumentReference<Map<String, dynamic>?>?> addInfoContact(
    InfoContactSchema newInfoContact,
  ) async {
    final result = await _firestore.add(
      path: FirestorePath.infoContacts(),
      data: newInfoContact.toMap(),
    );

    return result;
  }

   /// update avec id
  Future<void> updateInfoContact(
    String idInfoContact,
    InfoContactSchema newInfoContact,
  ) async {
    await _firestore.update(
      path: FirestorePath.infoContact(idInfoContact),
      data: newInfoContact.toMap(),
    );
  }

  /// update avec idProfil
  Future<void> updateInfoContactWithIdProfil(
    String idProfil,
    InfoContactSchema newInfoContact,
  ) async {
    final infoContact = await getOneInfoContactWithIdProfil(idProfil);
    await updateInfoContact(infoContact!.id!, newInfoContact);
  }

  /// delete
  Future<void> deleteInfoContact(
    String idInfoContact,
  ) async {
    await _firestore.delete(path: FirestorePath.infoContact(idInfoContact));
  }

  /// delete avec id profil
  Future<void> deleteInfoContactWithIdProfil(
    String idProfil,
  ) async {
    final infoContact = await getOneInfoContactWithIdProfil(idProfil);
    await deleteInfoContact(infoContact!.id!);
  }
}
