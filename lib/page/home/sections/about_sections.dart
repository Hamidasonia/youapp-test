part of '../home_page.dart';

class _AboutSections extends StatefulWidget {
  @override
  State<_AboutSections> createState() => _AboutSectionsState();
}

class _AboutSectionsState extends State<_AboutSections> {
  late bool _editAbout;
  late String _selectedValue;
  late List<String> _options;
  late SingletonModel _model;

  @override
  void initState() {
    _editAbout = false;
    _selectedValue = 'Male';
    _options = [
      'Male',
      'Female',
    ];
    _model = SingletonModel.withContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'About',
                style: AppTextStyle.bold(),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _editAbout = !_editAbout;
                  });
                  if (!_editAbout) {
                    Helper().showToast('Success update data');
                  }
                },
                child: !_editAbout
                    ? SvgPicture.asset(
                        kIcEdit,
                        width: 17,
                        height: 17,
                      )
                    : GradientText(
                        'Save & Update',
                        gradient: LinearGradient(colors: hGolden),
                        style: AppTextStyle.medium(),
                      ),
              )
            ],
          ),
          const SizedBox(height: 33),
          !_editAbout
              ? _model.user!.data.name!.isEmpty
                  ? Text(
                      'Add in your your to help others know you better',
                      style:
                          AppTextStyle.medium(color: hWhite.withOpacity(.52)),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Birthday: ',
                              style: AppTextStyle.medium(
                                color: hWhite.withOpacity(.33),
                              ),
                            ),
                            Text(
                              _model.user!.data.birthday!,
                              style: AppTextStyle.medium(),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Horoscope: ',
                              style: AppTextStyle.medium(
                                color: hWhite.withOpacity(.33),
                              ),
                            ),
                            Text(
                              _model.user!.data.horoscope!,
                              style: AppTextStyle.medium(),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Zodiac: ',
                              style: AppTextStyle.medium(
                                color: hWhite.withOpacity(.33),
                              ),
                            ),
                            Text(
                              _model.user!.data.zodiac!,
                              style: AppTextStyle.medium(),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Height: ',
                              style: AppTextStyle.medium(
                                color: hWhite.withOpacity(.33),
                              ),
                            ),
                            Text(
                              '${_model.user!.data.height} cm',
                              style: AppTextStyle.medium(),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              'Weight: ',
                              style: AppTextStyle.medium(
                                color: hWhite.withOpacity(.33),
                              ),
                            ),
                            Text(
                              '${_model.user!.data.weight} kg',
                              style: AppTextStyle.medium(),
                            )
                          ],
                        ),
                      ],
                    )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Container(
                            height: 57,
                            width: 57,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(17)),
                              color: hWhite.withOpacity(0.08),
                            ),
                            child: SvgPicture.asset('assets/icons/add_ic.svg'),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Add image',
                            style: AppTextStyle.medium(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 29),
                    const _FormSection(
                      title: 'Display name:',
                      hint: 'Enter name',
                      readOnly: false,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Gender:',
                          style: AppTextStyle.medium(
                              color: hWhite.withOpacity(.33)),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 36,
                            width: 202,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: HexColor('#D9D9D9').withOpacity(.06),
                                border: Border.all(
                                  color: hWhite.withOpacity(.22),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    style: AppTextStyle.medium(
                                      color: Colors.white.withOpacity(.4),
                                      fontSize: 13,
                                    ),
                                    value: _selectedValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedValue = newValue!;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: hWhite,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    underline: Container(),
                                    dropdownColor: hPrimary3,
                                    items: _options
                                        .map<DropdownMenuItem<String>>(
                                            (String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            option,
                                            style: AppTextStyle.medium(
                                              color: hWhite,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    _FormSection(
                      title: 'Birthday:',
                      hint: _model.user?.data.birthday ?? 'DD MM YYYY',
                      readOnly: true,
                    ),
                    const SizedBox(height: 12),
                    _FormSection(
                      title: 'Horoscope:',
                      hint: _model.user?.data.horoscope ?? '--',
                      readOnly: true,
                    ),
                    const SizedBox(height: 12),
                    _FormSection(
                      title: 'Zodiac',
                      hint: _model.user?.data.zodiac ?? '--',
                      readOnly: true,
                    ),
                    const SizedBox(height: 12),
                    _FormSection(
                      title: 'Height',
                      hint: '${_model.user?.data.height ?? 'Add height'}',
                      readOnly: false,
                    ),
                    const SizedBox(height: 12),
                    _FormSection(
                      title: 'Weight',
                      hint: '${_model.user?.data.height ?? 'Add weight'}',
                      readOnly: false,
                    ),
                  ],
                ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
