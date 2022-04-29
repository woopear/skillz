import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillz/src/components/box_brand_app/box_brand_app.dart';
import 'package:skillz/src/components/btn_close/btn_close.dart';
import 'package:skillz/src/components/btn_save/btn_save.dart';
import 'package:skillz/src/components/btn_text/btn_text.dart';
import 'package:skillz/src/components/checkbox_list/checkbox_list.dart';
import 'package:skillz/src/components/copyright_footer/copyright_footer.dart';
import 'package:skillz/src/components/input_basic/input_basic.dart';
import 'package:skillz/src/components/label_input/label_input.dart';
import 'package:skillz/src/components/separate/separate.dart';
import 'package:skillz/src/components/link_footer/link_footer.dart';
import 'package:skillz/src/components/sub_title_footer/sub_title_footer.dart';
import 'package:skillz/src/components/sub_title_section_commerce/sub_title_section_commerce.dart';
import 'package:skillz/src/components/title_footer/title_footer.dart';
import 'package:skillz/src/components/title_page_app/title_page_app.dart';
import 'package:skillz/src/components/title_section_commerce/title_section_commerce.dart';
import 'package:skillz/src/components/title_text_footer/title_text_footer.dart';
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
                        linkFooter(
                          onPressed: () {},
                          text: 'Conditions générales',
                        ),
                        titleFooter(text: 'Skillz'),
                        subTitleFooter(text: 'Gèrer les compétences de vos collaborateurs'),
                        copyrightFooter(text: '© skillz - 2022'),
                        boxBrandApp(brand: 'Skillz', context: context),
                        TitleSectionCommerce(text: 'Compétences'),
                        SubTitleSectionCommerce(text: 'Voici quelque compétence à mon actif'),
                        TitlePageApp(text: 'Collaborateur'),
                        titleTextFooter(text: 'je suis le titre'),
                        BtnText(onPressed: (){}, text: 'je suis le btn'),
                        btnClose(onPressed: () {}),
                        btnSave(onPressed: () {}),
                        labelInput(text: 'coucou :'),
                        inputBasic(
                          controller: TextEditingController(text: ''),
                          labelText: 'le titre',
                        ),
                        inputBasic(
                          controller: TextEditingController(text: ''),
                          hintText: 'le texte',
                          maxLines: 6,
                        ),
                        CheckBoxList(textcheckbox: 'coucou', value: false),
                        Separate(margin: const EdgeInsets.all(10)),
                        CheckBoxList(width: 700.0, textcheckbox: 'coucou', value: false),
                        CheckBoxList(
                            width: 700.0, textcheckbox: 'coucou', value: false),
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
