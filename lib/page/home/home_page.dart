import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/page/home/components/components.dart';
import 'package:youapp_test/page/interest/interest_page.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/tool/helper.dart';
import 'package:youapp_test/tool/hex_color.dart';
import 'package:youapp_test/widget/gradient_text.dart';

part 'sections/header_sections.dart';

part 'sections/about_sections.dart';

part 'sections/form_section.dart';

class HomePage extends StatefulWidget {
  static const String name = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logout() async {
    SPData.reset();
    SingletonModel.shared.login = null;
    SingletonModel.shared.isLoggedIn = false;
    await Helper().moveToPage(
      context,
      route: OnBoardPage.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hPrimary3,
      appBar: AppBar(
        backgroundColor: hPrimary3,
        title: Text(
          '@jhondoe',
          style: AppTextStyle.bold(),
        ),
        centerTitle: true,
        leading: const BackLeading(),
        leadingWidth: 100,
        elevation: 0.0,
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: hWhite,
        child: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: hPrimary3,
          ),
          onPressed: _logout,
        ),
      ),
      body: ListView(
        children: [
          _HeaderSections(),
          const SizedBox(height: 24),
          _AboutSections(),
          const SizedBox(height: 18),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              color: hCard2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interest',
                      style: AppTextStyle.bold(),
                    ),
                    GestureDetector(
                      onTap: () => Helper().jumpToPage(
                        context,
                        route: InterestPage.name,
                      ),
                      child: SvgPicture.asset(
                        kIcEdit,
                        width: 17,
                        height: 17,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 33),
                Text(
                  'Add in your interest to find a better match',
                  style: AppTextStyle.medium(color: hWhite.withOpacity(.52)),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
