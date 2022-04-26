import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/competence/schema/competence_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class CompetenceState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// get all
  Future<List<CompetenceSchema>> getAllCompetence() async {
    final result = await _firestore.getCol(
      path: FirestorePath.competences(),
      builder: (data, documentId) => CompetenceSchema.formMap(data, documentId),
    );
    return result;
  }

  /// get one
  Future<DocumentSnapshot<Map<String, dynamic>>> getOneCompetence(
    String idCompetence,
  ) async {
    final result = await _firestore.getDoc(
      path: FirestorePath.competence(idCompetence),
    );
    return result;
  }

  /// add
  Future<DocumentReference<Map<String, dynamic>?>?> addCompetence(
    CompetenceSchema newCompetence,
  ) async {
    final result = await _firestore.add(
      path: FirestorePath.competences(),
      data: newCompetence.toMap(),
      returnData: true,
    );
    return result;
  }

  /// update
  Future<void> updateCompetence(
    String idCompetence,
    CompetenceSchema newCompetence,
  ) async {
    await _firestore.update(
      path: FirestorePath.competence(idCompetence),
      data: newCompetence.toMap(),
    );
  }

  /// delete
  Future<void> deleteCompetence(String idCompetence) async {
    await _firestore.delete(path: FirestorePath.competence(idCompetence));
  }
}
