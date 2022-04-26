import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models_shared/info_contact/state/info_contact_state.dart';

final infoContactChange =
    ChangeNotifierProvider<InfoContactState>((ref) => InfoContactState());
