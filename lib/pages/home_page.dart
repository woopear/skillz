import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/models/setting/state/setting_provider.dart';
import 'package:skillz/pages/error_page.dart';
import 'package:skillz/pages/loading_page.dart';
import 'package:skillz/src/utils/const/text_error.dart';
import 'package:skillz/src/components/index.dart';

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
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return ref.watch(settingsStream).when(
          data: (settings) {
            /* build
            if (settings[0].build) {
              return BuildPage(textInfo: Globals.textInfoPageBuild,);
            }

            /// maintenance
            if (settings[0].wait) {
              return BuildPage(textInfo: Globals.textInfoPageMaintain,);
            }*/

            /// page home
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: SizedBox(
                    width: _width,
                    height: _height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Skillz',
                          style: const TextStyle().copyWith(
                            fontSize: 96.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        /// test btn elevated
                        btnElevated(
                          context: context,
                          onPressed: () {},
                          text: 'Se connecter',
                          fontSize: 26.0,
                          paddingBtn: const EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 24.0,
                          ),
                        ),
                        btnElevated(
                          context: context,
                          onPressed: () {},
                          text: 'Se connecter',
                        ),

                        /// test btn text
                        BtnText(
                          onPressed: () {},
                          text: 'Se connecter',
                        ),
                        BtnText(
                          onPressed: () {},
                          text: 'Se connecter',
                          fontSize: 24.0,
                        ),

                        /// test btn text icon
                        BtnTextIcon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                          ),
                          text: "Se connecter",
                        ),
                        BtnTextIcon(
                          onPressed: () {},
                          text: "Se connecter",
                        ),
                      ],
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
