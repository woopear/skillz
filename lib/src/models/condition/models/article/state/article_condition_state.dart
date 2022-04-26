import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/condition/models/article/schema/article_condition_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class ArticleConditionState extends ChangeNotifier {
  /// instance de firestore
  final _firestore = WooFirestore.instance;

  /// ecoute de tout les articles d'ue condition
  Stream<List<ArticleConditionSchema>> streamArticleOfCondition(
      String idCondition) {
    return _firestore.streamCol(
      path: FirestorePath.articlesCondition(idCondition),
      builder: (data, documentId) =>
          ArticleConditionSchema.fromMap(data, documentId),
    );
  }

  /// ajouter un article d'une condition
  Future<DocumentReference<Map<String, dynamic>?>?>? addArticleOfCondition(
      String idCondition, ArticleConditionSchema newArticle) async {
    final result = await _firestore.add(
      path: FirestorePath.articlesCondition(idCondition),
      data: newArticle.toMap(),
      returnData: true,
    );

    return result;
  }

  /// modifier un article d'une condition
  Future<void> updateArticleCondition(String idCondition, String idArticle,
      ArticleConditionSchema newArticle) async {
    await _firestore.update(
      path: FirestorePath.articleCondition(idCondition, idArticle),
      data: newArticle.toMap(),
    );
  }

  /// supprimer un article d'une condition
  Future<void> deleteArticleOfCondition(
      String idCondition, String idArticle) async {
    await _firestore.delete(
      path: FirestorePath.articleCondition(idCondition, idArticle),
    );
  }

  /// supprimer tous les articles d'une condition
  Future<void> deleteAllArticleOfCondition(String idCondition) async {
    /// instance firestore pour batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    /// ref collection path
    CollectionReference refArticles = FirebaseFirestore.instance.collection(
      FirestorePath.articlesCondition(idCondition),
    );

    /// boucle pour delete les articles
    return refArticles.get().then((querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        /// delete article
        batch.delete(doc.reference);
      }

      notifyListeners();
      return batch.commit();
    });
  }

  /// state de la class ArticleState
  final articleConditionChange = ChangeNotifierProvider<ArticleConditionState>(
      (ref) => ArticleConditionState());
}
