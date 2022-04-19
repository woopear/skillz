import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/utils/config/routes/routes.dart';
import 'package:skillz/src/utils/config/theme/theme.dart';
import 'package:skillz/src/utils/const/globals.dart';
import 'package:skillz/src/utils/fire/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:woo_theme_mode/woo_theme_mode.dart';

Future<void> main() async {
  /// enleve le # dans l'url
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  /// config firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

/// widget d'entrée
class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Globals.titleApp,
      themeMode: ref.watch(wooThemeChange).themeMode,
      theme: themeClaire,
      darkTheme: themeDark,
      initialRoute: Routes().home,
      routes: Routes().urls(),
    );
  }
}
