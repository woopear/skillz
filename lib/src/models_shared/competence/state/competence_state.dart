import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/need_job/state/need_job_profil_state.dart';
import 'package:skillz/src/models/profil/models/wallet_competence/state/wallet_competence_profil_state.dart';
import 'package:skillz/src/models/profil/models/workstation/state/workstation_profil_state.dart';
import 'package:skillz/src/models_shared/competence/schema/competence_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class CompetenceState extends ChangeNotifier {
  final _firestore = WooFirestore.instance;
  final _walletCompetenceProfilState = WalletCompetenceProfilState();
  final _workstationProfilState = WorkstationProfilState();
  final _needJobProfilState = NeedJobProfilState();

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
  Future<bool> deleteCompetence(
    String idProfil,
    String idCompanie,
    String idJobProfil,
    String idCompetence,
  ) async {
    /// get all need job avec id competence
    final njps = await _needJobProfilState.getAllNeedJobWithIdCompetence(
      idProfil,
      idCompanie,
      idJobProfil,
      idCompetence,
    );
    if (njps.isNotEmpty) {
      return false;
    }

    /// get all walletcompetence avec id competence
    final wcps = await _walletCompetenceProfilState
        .getAllWalletCompetenceWithIdCompetence(
      idProfil,
      idCompetence,
    );
    if (wcps.isNotEmpty) {
      return false;
    }

    /// get all workstation avec id competence
    final wps = await _workstationProfilState.getAllWorkstationWithIdCompetence(
      idProfil,
      idCompetence,
    );
    if (wps.isNotEmpty) {
      return false;
    }

    /// delete competence
    await _firestore.delete(path: FirestorePath.competence(idCompetence));

    return true;
  }
}
