import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/profil/models/companie/state/companie_profil_state.dart';

final companieProfilChange =
    ChangeNotifierProvider<CompanieProfilState>((ref) => CompanieProfilState());
