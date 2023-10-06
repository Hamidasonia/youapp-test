import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youapp_test/bloc/user/user_bloc.dart';
import 'package:youapp_test/bloc/user/user_event.dart';
import 'package:youapp_test/bloc/user/user_state.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/data/sp_data.dart';
import 'package:youapp_test/dialog/app_alert_dialog.dart';
import 'package:youapp_test/dialog/exit_dialog.dart';
import 'package:youapp_test/model/app/singleton_model.dart';
import 'package:youapp_test/model/user_model.dart';
import 'package:youapp_test/page/home/components/components.dart';
import 'package:youapp_test/page/home/shimmer/shimmer.dart';
import 'package:youapp_test/page/interest/interest_page.dart';
import 'package:youapp_test/page/onboard_page.dart';
import 'package:youapp_test/tool/helper.dart';
import 'package:youapp_test/tool/hex_color.dart';
import 'package:youapp_test/tool/skeleton_animation.dart';
import 'package:youapp_test/tool/time_helper.dart';
import 'package:youapp_test/widget/gradient_text.dart';

part 'sections/header_sections.dart';

part 'sections/about_sections.dart';

part 'sections/form_section.dart';

part 'sections/interest_sections.dart';

class HomePage extends StatefulWidget {
  static const String name = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SingletonModel _model;
  late bool _isLoading;
  late Helper _helper;
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _model = SingletonModel.withContext(context);
    _isLoading = true;
    _helper = Helper();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(GetUserEvent());
  }

  void _logout() async {
    SPData.reset();
    SingletonModel.shared.login = null;
    SingletonModel.shared.isLoggedIn = false;
    await Helper().moveToPage(
      context,
      route: OnBoardPage.name,
    );
  }

  Future<bool> _onWillPop() async {
    bool exit = await openExitDialog(context) ?? false;
    if (exit) {
      setState(() {
        exit = true;
      });
    }
    return Future(() => exit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _userBloc,
      listener: (context, state) {
        if (state is GetUserSuccessState) {
          _isLoading = false;
          setState(() {
            SingletonModel.shared.user = state.data;
          });
          _helper.showToast('Success to load data user');
        } else if (state is GetUserFailedState) {
          _isLoading = false;
          _helper.showToast('Failed to load data User');
        }
      },
      child: BlocBuilder(
        bloc: _userBloc,
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              backgroundColor: hPrimary3,
              appBar: AppBar(
                backgroundColor: hPrimary3,
                title: !_isLoading
                    ? Text(
                        '@${_model.user?.data.username ?? ''}',
                        style: AppTextStyle.bold(),
                      )
                    : const SkeletonAnimation(
                        width: 111,
                        height: 19,
                        radius: 0,
                      ),
                centerTitle: true,
                leading: BackLeading(onTap: _onWillPop),
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
                  onPressed: () => openAppAlertDialog(
                    context,
                    title: "Exit",
                    message: "Are you sure to logout?",
                    leftButtonText: "No",
                    rightButtonText: "Yes",
                    rightButtonColor: Colors.red,
                    onLeftButtonClick: (c) => Navigator.pop(c),
                    onRightButtonClick: (c) => _logout(),
                  ),
                ),
              ),
              body: ListView(
                children: [
                  !_isLoading
                      ? _HeaderSections(user: _model.user!)
                      : const HeaderShimmer(),
                  const SizedBox(height: 24),
                  !_isLoading ? _AboutSections() : const AboutShimmer(),
                  const SizedBox(height: 18),
                  !_isLoading
                      ? _InterestSections(user: _model.user!)
                      : const InterestShimmer(),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
