import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/profil/state/profil_state.dart';

final profilChange =
    ChangeNotifierProvider<ProfilState>((ref) => ProfilState());
