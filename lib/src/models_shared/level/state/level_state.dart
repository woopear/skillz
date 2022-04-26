import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/level/schema/level_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class LevelState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  late Stream<LevelSchema?>? _levelSelectedForUpdate;
  Stream<LevelSchema?>? get levelSelectedForUpdate => _levelSelectedForUpdate;

  /// stream all
  Stream<List<LevelSchema>> streamLevels() {
    return _firestore.streamCol(
      path: FirestorePath.levels(),
      builder: (data, documentId) => LevelSchema.fromMap(data, documentId),
    );
  }

  /// stream one
  Stream<LevelSchema?>? streamLevel(String idLevel) {
    _levelSelectedForUpdate = _firestore.streamDoc(
      path: FirestorePath.level(idLevel),
      builder: (data, documentId) => LevelSchema.fromMap(data, documentId),
    );
    notifyListeners();
    return null;
  }

  /// add
  Future<DocumentReference<Map<String, dynamic>?>?> addLevel(
    LevelSchema newLevel,
  ) async {
    final result = await _firestore.add(
      path: FirestorePath.levels(),
      data: newLevel.toMap(),
      returnData: true,
    );
    return result;
  }

  /// update
  Future<void> updateLevel(String idLevel, LevelSchema newLevel) async {
    await _firestore.update(
      path: FirestorePath.level(idLevel),
      data: newLevel.toMap(),
    );
  }

  /// delete
  Future<void> deleteLevel(String idLevel) async {
    await _firestore.delete(path: FirestorePath.level(idLevel));
  }
}
