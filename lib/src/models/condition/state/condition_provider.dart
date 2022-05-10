import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/condition/state/condition_state.dart';

/// state de la class Condition
  final conditionChange =
      ChangeNotifierProvider<ConditionState>((ref) => ConditionState());