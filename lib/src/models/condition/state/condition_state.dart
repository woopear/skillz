import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/condition/models/article/state/article_condition_state.dart';
import 'package:skillz/src/models/condition/schema/condition_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class ConditionState extends ChangeNotifier {
  /// instance de firestore
  final _firestore = WooFirestore.instance;

  /// variable pour articleConditionState
  final _articleConditionState = ArticleConditionState();

  /// ecoute de toute les conditions
  Stream<List<ConditionSchema>> streamConditions() {
    return _firestore.streamCol<ConditionSchema>(
      path: FirestorePath.conditions(),
      builder: (data, documentId) => ConditionSchema.fromMap(data, documentId),
    );
  }

  /// ecoute d'un condition par son id
  Stream<ConditionSchema> stremConditionById(String idCondition) {
    return _firestore.streamDoc<ConditionSchema>(
      path: FirestorePath.condition(idCondition),
      builder: (data, documentId) => ConditionSchema.fromMap(data, documentId),
    );
  }

  /// ajouter une condition
  Future<void> addCondition(ConditionSchema newCondition) async {
    await _firestore.add(
      path: FirestorePath.conditions(),
      data: newCondition.toMap(),
    );
  }

  /// update une condition
  Future<void> updateCondition(
      String idCondition, ConditionSchema newCondition) async {
    await _firestore.update(
      path: FirestorePath.condition(idCondition),
      data: newCondition.toMap(),
    );
  }

  /// delete une condition
  Future<void> deleteCondition(String idCondition) async {
    /// delete tous les articles
    await _articleConditionState.deleteAllArticleOfCondition(idCondition);

    /// delete la condition selectionner
    await _firestore.delete(
      path: FirestorePath.condition(idCondition),
    );
  }

  /// state de la class Condition
  final conditionChange = ChangeNotifierProvider((ref) => ConditionState());
}
