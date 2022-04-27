import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillz/src/models/profil/models/job/schema/job_profil_schema.dart';
import 'package:skillz/src/models/profil/models/need_job/state/need_job_profil_state.dart';
import 'package:skillz/src/utils/fire/firestorepath.dart';
import 'package:woo_firestore_crud/woo_firestore_crud.dart';

class JobProfilState extends ChangeNotifier {
  /// instance de firestore
  final _firestore = WooFirestore.instance;

  /// intance de needjob
  final _needJobProfil = NeedJobProfilState();

  /// ecouter tous les jobs
  Stream<List<JobProfilSchema>> streamJobsOfCondition(
      String idProfil, String idCompanie) {
    return _firestore.streamCol(
      path: FirestorePath.jobs(idProfil, idCompanie),
      builder: (data, documentId) => JobProfilSchema.fromMap(data, documentId),
    );
  }

  /// ajouter un job
  Future<DocumentReference<Map<String, dynamic>?>?>? addJobProfil(
      String idProfil, String idCompanie, JobProfilSchema newJobProfil) async {
    final result = await _firestore.add(
      path: FirestorePath.jobs(idProfil, idCompanie),
      data: newJobProfil.toMap(),
      returnData: true,
    );

    return result;
  }

  /// update un job
  Future<void> updateJobProfil(String idProfil, String idCompanie,
      String idJobProfil, JobProfilSchema newJobProfil) async {
    await _firestore.update(
      path: FirestorePath.job(idProfil, idCompanie, idJobProfil),
      data: newJobProfil.toMap(),
    );
  }

  /// delete un job
  Future<void> deleteJobProfilById(
      String idProfil, String idCompanie, String idJobProfil) async {
    /// delete les needJob
    await _needJobProfil.deleteAllNeedJobProfil(
        idProfil, idCompanie, idJobProfil);

    await _firestore.delete(
      path: FirestorePath.job(idProfil, idCompanie, idJobProfil),
    );
  }

  /// delete tous les jobs d'un profil
  Future<void> deleteAllJobProfil(
      String idProfil, String idCompanie, String idJobProfil) async {
    /// instance firestore pour batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    /// ref collection path
    CollectionReference refJobs = FirebaseFirestore.instance
        .collection(FirestorePath.jobs(idProfil, idCompanie));

    /// boucle pour delete les jobs
    return refJobs.get().then((querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        /// delete les needJob
        await _needJobProfil.deleteAllNeedJobProfil(
            idProfil, idCompanie, idJobProfil);

        /// delete article
        batch.delete(doc.reference);
      }

      notifyListeners();
      return batch.commit();
    });
  }
}
