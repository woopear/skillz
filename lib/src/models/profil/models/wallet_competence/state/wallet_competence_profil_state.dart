import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/wallet_competence/schema/wallet_competence_profil_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class WalletCompetenceProfilState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;

  /// stream
  Stream<WalletCompetenceProfilSchema> streamWalletCompetence(
    String idProfil,
  ) {
    final result = _firestore.streamCol(
      path: FirestorePath.walletCompetencesProfil(idProfil),
      builder: (data, documentId) =>
          WalletCompetenceProfilSchema.formMap(data, documentId),
    );

    return result.map((event) => event[0]);
  }

  /// add
  Future<void> addWalletCompetence(
    String idProfil,
    WalletCompetenceProfilSchema newWalletCompetence,
  ) async {
    await _firestore.add(
      path: FirestorePath.walletCompetencesProfil(idProfil),
      data: newWalletCompetence.toMap(),
    );
  }

  /// update
  Future<void> updateWalletCompetence(
    String idProfil,
    String idWalletCompetence,
    WalletCompetenceProfilSchema newWalletCompetence,
  ) async {
    await _firestore.update(
      path: FirestorePath.walletCompetenceProfil(idProfil, idWalletCompetence),
      data: newWalletCompetence.toMap(),
    );
  }

  /// delete
  Future<void> deleteWalletCompetence(
    String idProfil,
    String idWalletCompetence,
  ) async {
    await _firestore.delete(
      path: FirestorePath.walletCompetenceProfil(
        idProfil,
        idWalletCompetence,
      ),
    );
  }
}
