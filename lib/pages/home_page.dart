import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/models/setting/state/setting_provider.dart';
import 'package:skillz/pages/build_page.dart';
import 'package:skillz/pages/error_page.dart';
import 'package:skillz/pages/loading_page.dart';
import 'package:skillz/utils/const/globals.dart';
import 'package:skillz/utils/const/text_error.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  /// on charge la page home
  /// si probleme de request on affiche page error
  /// pendant load on affiche la page loading
  /// ensuite on ecoute la data =>
  /// si build on affiche page build
  /// si maintenance on affiche maintenance

  @override
  Widget build(BuildContext context) {
    return ref.watch(settingsStream).when(
          data: (settings) {
            /// build
            if (settings[0].build) {
              return BuildPage(textInfo: Globals.textInfoPageBuild,);
            }

            /// maintenance
            if (settings[0].wait) {
              return BuildPage(textInfo: Globals.textInfoPageMaintain,);
            }

            /// page home
            return SafeArea(
              child: Scaffold(
                body: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      child: const Text('home'),
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, stack) => ErrorPage(
            messageError: TextError.errorDataPageHome,
          ),
          loading: () => const LoadingPage(),
        );
  }
}
