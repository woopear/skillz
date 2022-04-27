import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/job/schema/job_profil_schema.dart';
import 'package:skillz/src/models/profil/models/need_job/schema/need_job_profil_schema.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class NeedJobProfilState extends ChangeNotifier {
  /// instance de firestore
  final _firestore = WooFirestore.instance;

  /// ecouter tous les needjobs du job du profil
  Stream<List<NeedJobProfilSchema>> streamJobsOfCondition(
      String idProfil, String idCompanie, String idJobProfil) {
    return _firestore.streamCol(
      path: FirestorePath.needJobs(idProfil, idCompanie, idJobProfil),
      builder: (data, documentId) =>
          NeedJobProfilSchema.fromMap(data, documentId),
    );
  }

  /// get with id level
  Future<List<NeedJobProfilSchema>> getAllNeedJobWithIdLevel(
    String idProfil,
    String idCompanie,
    String idJobProfil,
    String idLevel,
  ) async {
    return await _firestore.getCol(
      path: FirestorePath.needJobs(
        idProfil,
        idCompanie,
        idJobProfil,
      ),
      builder: (data, documentId) =>
          NeedJobProfilSchema.fromMap(data, documentId),
      queryBuilder: (query) => query.where(
        'idLevel',
        isEqualTo: idLevel,
      ),
    );
  }

  /// get with id competence
  Future<List<NeedJobProfilSchema>> getAllNeedJobWithIdCompetence(
    String idProfil,
    String idCompanie,
    String idJobProfil,
    String idCompetence,
  ) async {
    return await _firestore.getCol(
      path: FirestorePath.needJobs(
        idProfil,
        idCompanie,
        idJobProfil,
      ),
      builder: (data, documentId) =>
          NeedJobProfilSchema.fromMap(data, documentId),
      queryBuilder: (query) => query.where(
        'idLevel',
        isEqualTo: idCompetence,
      ),
    );
  }

  /// ajouter un needjob
  Future<DocumentReference<Map<String, dynamic>?>?>? addNeedJobProfil(
      String idProfil,
      String idCompanie,
      String idJobProfil,
      JobProfilSchema newNeedJobProfil) async {
    final result = await _firestore.add(
      path: FirestorePath.needJobs(idProfil, idCompanie, idJobProfil),
      data: newNeedJobProfil.toMap(),
      returnData: true,
    );

    return result;
  }

  /// update un needjob
  Future<void> updateNeedJobProfil(
      String idProfil,
      String idCompanie,
      String idJobProfil,
      String idNeedJobProfil,
      JobProfilSchema newNeedJobProfil) async {
    await _firestore.update(
      path: FirestorePath.needJob(
          idProfil, idCompanie, idJobProfil, idNeedJobProfil),
      data: newNeedJobProfil.toMap(),
    );
  }

  /// delete un needjob
  Future<void> deleteNeedJobProfilById(String idProfil, String idCompanie,
      String idJobProfil, String idNeedJobProfil) async {
    await _firestore.delete(
      path: FirestorePath.needJob(
          idProfil, idCompanie, idJobProfil, idNeedJobProfil),
    );
  }

  /// delete tous les needjobs d'un profil
  Future<void> deleteAllNeedJobProfil(
      String idProfil, String idCompanie, String idJobProfil) async {
    /// instance firestore pour batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    /// ref collection path
    CollectionReference refJobs = FirebaseFirestore.instance.collection(
      FirestorePath.needJobs(
        idProfil,
        idCompanie,
        idJobProfil,
      ),
    );

    /// boucle pour delete les needjobs
    return refJobs.get().then((querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        /// delete article
        batch.delete(doc.reference);
      }

      notifyListeners();
      return batch.commit();
    });
  }
}
