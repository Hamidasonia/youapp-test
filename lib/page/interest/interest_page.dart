import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:youapp_test/bloc/user/user_bloc.dart';
import 'package:youapp_test/bloc/user/user_event.dart';
import 'package:youapp_test/bloc/user/user_state.dart';
import 'package:youapp_test/common/constans.dart';
import 'package:youapp_test/common/styles.dart';
import 'package:youapp_test/model/user_model.dart';
import 'package:youapp_test/page/home/components/components.dart';
import 'package:youapp_test/page/home/home_page.dart';
import 'package:youapp_test/tool/helper.dart';
import 'package:youapp_test/tool/hex_color.dart';
import 'package:youapp_test/tool/skeleton_animation.dart';
import 'package:youapp_test/widget/gradient_text.dart';

class InterestPage extends StatefulWidget {
  static const String name = "/interest";

  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  late double _distanceToField;
  late TextfieldTagsController _controller;
  UserModel? _user;
  late UserBloc _userBloc;
  late bool _isLoading;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _isLoading = true;
    _userBloc.add(GetUserEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _update() {
    setState(() {
      _userBloc.add(UpdateUserEvent(
          name: _user!.data.name,
          birthday: _user!.data.birthday,
          height: _user!.data.height,
          weight: _user!.data.weight,
          interest: _controller.getTags));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _userBloc,
      listener: (context, state) {
        if (state is GetUserSuccessState) {
          _isLoading = false;
          setState(() {
            _user = state.data;
          });
          printLog(_user!.data.interests);
        } else if (state is GetUserFailedState) {
          _isLoading = false;
        } else if (state is UpdateUserSuccessState) {
          Helper().showToast('Update success');
          Helper().moveToPage(context, route: HomePage.name);
        } else if (state is UpdateUserFailedState) {
          Helper().showToast('Update failed');
          Helper().moveToPage(context, route: HomePage.name);
        }
      },
      child: BlocBuilder(
        bloc: _userBloc,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [hPrimary1, hPrimary2, hPrimary3],
                    radius: 2,
                    center: Alignment.topRight,
                    focal: Alignment.topRight,
                    focalRadius: 0.25,
                  ),
                ),
                child: ListView(
                  children: [
                    const SizedBox(height: 37),
                    Row(
                      children: [
                        BackLeading(
                          onTap: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: GestureDetector(
                            onTap: _update,
                            child: GradientText(
                              'Save',
                              style: AppTextStyle.bold(),
                              gradient: LinearGradient(colors: hBlue),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 73),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: GradientText(
                        'Tell everyone about yourself',
                        style: AppTextStyle.bold(fontSize: 14),
                        gradient: LinearGradient(colors: hGolden),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Text(
                        'What interest you?',
                        style: AppTextStyle.bold(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: !_isLoading
                          ? TextFieldTags(
                              textfieldTagsController: _controller,
                              textSeparators: const [' '],
                              letterCase: LetterCase.normal,
                              initialTags: _user!.data.interests,
                              validator: (String tag) {
                                if (tag == 'Eat') {
                                  return 'Please enter again';
                                } else if (_controller.getTags!.contains(tag)) {
                                  return 'You already enter that';
                                }
                                return null;
                              },
                              inputfieldBuilder: (context, tec, fn, error,
                                  onChanged, onSubmitted) {
                                return ((context, sc, tags, onTagDelete) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: TextField(
                                      controller: tec,
                                      focusNode: fn,
                                      style: AppTextStyle.medium(),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        filled: true,
                                        fillColor: HexColor('#D9D9D9')
                                            .withOpacity(.06),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        hintText:
                                            _controller.hasTags ? '' : " .",
                                        errorText: error,
                                        prefixIconConstraints: BoxConstraints(
                                            maxWidth: _distanceToField * 0.74),
                                        prefixIcon: tags.isNotEmpty
                                            ? SingleChildScrollView(
                                                controller: sc,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                    children:
                                                        tags.map((String tag) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(4),
                                                      ),
                                                      color: hWhite
                                                          .withOpacity(0.1),
                                                    ),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 5.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          child: Text(
                                                            tag,
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          onTap: () {
                                                            printLog(
                                                                "$tag selected");
                                                          },
                                                        ),
                                                        const SizedBox(
                                                            width: 4.0),
                                                        InkWell(
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 14.0,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    233,
                                                                    233,
                                                                    233),
                                                          ),
                                                          onTap: () {
                                                            onTagDelete(tag);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }).toList()),
                                              )
                                            : null,
                                      ),
                                      onChanged: onChanged,
                                      onSubmitted: onSubmitted,
                                    ),
                                  );
                                });
                              },
                            )
                          : const SkeletonAnimation(
                              width: double.infinity,
                              height: 80,
                            ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
