import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/profil/models/need_job/state/need_job_profil_state.dart';

final jobProfilChange = ChangeNotifierProvider<NeedJobProfilState>((ref) => NeedJobProfilState());