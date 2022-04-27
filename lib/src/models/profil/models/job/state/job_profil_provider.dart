import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/profil/models/job/state/job_profil_state.dart';

final jobProfilChange = ChangeNotifierProvider<JobProfilState>((ref) => JobProfilState());