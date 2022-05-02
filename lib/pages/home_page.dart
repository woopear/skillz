import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/components/box_primary/box_primary.dart';
import 'package:skillz/src/components/display_avatar_circle_name/display_avatar_circle_name.dart';
import 'package:skillz/src/models/setting/state/setting_provider.dart';
import 'package:skillz/pages/error_page.dart';
import 'package:skillz/pages/loading_page.dart';
import 'package:skillz/src/utils/const/text_error.dart';

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
                        boxPrimary(
                          width: double.infinity,
                          context: context,
                          child: displayAvatartCircleName(
                            widthResponsive: _width,
                            userName: 'John Haimez',
                            context: context,
                          ),
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
