import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models_shared/competence/state/competence_state.dart';

final competenceChange =
    ChangeNotifierProvider<CompetenceState>((ref) => CompetenceState());
