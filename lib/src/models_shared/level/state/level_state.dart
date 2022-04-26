import 'package:flutter/material.dart';
import 'package:skillz/src/models_shared/level/schema/level_schema.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class LevelState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// stream all
  Stream<List<LevelSchema>> streamLevels() {}

  /// stream one
  Stream<LevelSchema> streamLevel() {}

  /// add
  Future<void> addLevel(LevelSchema newLevel) async {
    final result = await _firestore.add(
      path: path,
      data: newLevel.toMap(),
      returnData: true,
    );
  }

  /// update
  Future<void> updateLevel(String idLevel, LevelSchema newLevel) async {
    await _firestore.update(
      path: path,
      data: newLevel.toMap(),
    );
  }

  /// delete
  Future<void> deleteLevel(String idLevel) async {
    _firestore.delete(path: path);
  }
}
