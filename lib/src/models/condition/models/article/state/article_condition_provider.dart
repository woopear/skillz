import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/condition/models/article/state/article_condition_state.dart';

/// state de la class ArticleState
  final articleConditionChange = ChangeNotifierProvider<ArticleConditionState>(
      (ref) => ArticleConditionState());