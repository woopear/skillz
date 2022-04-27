import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/profil/models/wallet_competence/state/wallet_competence_profil_state.dart';

final walletCompetenceProfilChange =
    ChangeNotifierProvider<WalletCompetenceProfilState>(
  (ref) => WalletCompetenceProfilState(),
);
