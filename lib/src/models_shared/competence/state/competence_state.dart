import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/competence/schema/competence_schema.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class CompetenceState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  Future<List<CompetenceSchema>> getAllCompetence() async {
    final result = await _firestore.getCol(
      path: path,
      builder: (data, documentId) => CompetenceSchema.formMap(data, documentId),
    );
    return result;
  }

  Future<DocumentReference<Map<String, dynamic>?>?> addCompetence(CompetenceSchema newCompetence) async {
    final result = await _firestore.add(
      path: path,
      data: newCompetence.toMap(),
    );
    return result;
  }

  Future<void> updateCompetence(
      String idCompetence, CompetenceSchema newCompetence) async {}
  Future<void> deleteCompetence(String idCompetence) async {}
}
