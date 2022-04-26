import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models_shared/level/state/level_state.dart';

final levelChange = ChangeNotifierProvider<LevelState>((ref) => LevelState());
