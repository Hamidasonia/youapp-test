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
  late TextEditingController _cName;
  late TextEditingController _cBirthday;
  late TextEditingController _cHoroscope;
  late TextEditingController _cZodiac;
  late TextEditingController _cHeight;
  late TextEditingController _cWeight;
  late GlobalKey<FormState> _formKey;
  late bool _isLoading;
  late UserBloc _userBloc;
  DateTime? _dateTime;

  @override
  void initState() {
    _editAbout = false;
    _selectedValue = 'Male';
    _options = [
      'Male',
      'Female',
    ];
    _model = SingletonModel.withContext(context);
    _cName = TextEditingController(text: _model.user?.data.name ?? "");
    _cBirthday = TextEditingController(text: _model.user?.data.birthday ?? "");
    _cHoroscope =
        TextEditingController(text: _model.user?.data.horoscope ?? "");
    _cZodiac = TextEditingController(text: _model.user?.data.zodiac ?? "");
    _cHeight = TextEditingController(text: '${_model.user?.data.height ?? ""}');
    _cWeight = TextEditingController(text: '${_model.user?.data.weight ?? ""}');
    _formKey = GlobalKey();
    _isLoading = false;
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  void _update() {
    setState(() {
      _editAbout = !_editAbout;
    });
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
        _userBloc.add(UpdateUserEvent(
            name: _cName.text,
            birthday: _cBirthday.text,
            height: int.parse(_cHeight.text),
            weight: int.parse(_cWeight.text),
            interest: const []));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _userBloc,
      listener: (context, state) {
        if (state is UpdateUserSuccessState)  {
          _isLoading = false;
          _userBloc.add(GetUserEvent());
          Helper().showToast('Update success');
        } else if (state is UpdateUserFailedState) {
          _isLoading = false;
          Helper().showToast('Update failed');
        }
      },
      child: BlocBuilder(
        bloc: _userBloc,
        builder: (context, state) {
          return !_isLoading
              ? Container(
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
                          !_editAbout
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _editAbout = !_editAbout;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    kIcEdit,
                                    width: 17,
                                    height: 17,
                                  ),
                                )
                              : GestureDetector(
                                  onTap: _update,
                                  child: GradientText(
                                    'Save & Update',
                                    gradient: LinearGradient(colors: hGolden),
                                    style: AppTextStyle.medium(),
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(height: 33),
                      !_editAbout
                          ? _model.user!.data.name!.isEmpty
                              ? Text(
                                  'Add in your your to help others know you better',
                                  style: AppTextStyle.medium(
                                      color: hWhite.withOpacity(.52)),
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
                                          '${_model.user!.data.height!} cm',
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
                                          '${_model.user!.data.weight!} kg',
                                          style: AppTextStyle.medium(),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                          : Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 57,
                                          width: 57,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(17)),
                                            color: hWhite.withOpacity(0.08),
                                          ),
                                          child: SvgPicture.asset(
                                              'assets/icons/add_ic.svg'),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          'Add image',
                                          style:
                                              AppTextStyle.medium(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 29),
                                  _FormSection(
                                    controller: _cName,
                                    title: 'Display name:',
                                    hint: 'Enter name',
                                    readOnly: false,
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              color: HexColor('#D9D9D9')
                                                  .withOpacity(.06),
                                              border: Border.all(
                                                color: hWhite.withOpacity(.22),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(9.0),
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  style: AppTextStyle.medium(
                                                    color: Colors.white
                                                        .withOpacity(.4),
                                                    fontSize: 13,
                                                  ),
                                                  value: _selectedValue,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _selectedValue =
                                                          newValue!;
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: hWhite,
                                                  ),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  underline: Container(),
                                                  dropdownColor: hPrimary3,
                                                  items: _options.map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String option) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: option,
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          option,
                                                          style: AppTextStyle
                                                              .medium(
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
                                    controller: _cBirthday,
                                    title: 'Birthday:',
                                    hint: 'DD MM YYYY',
                                    readOnly: true,
                                    onTap: () async {
                                      await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1980),
                                        lastDate: DateTime(2099),
                                      ).then((date) {
                                        setState(() {
                                          _dateTime = date;
                                        });
                                      });
                                      setState(() {
                                        _cBirthday.text =
                                            TimeHelper.convertToBirthday(
                                                '$_dateTime');
                                        printLog(_cBirthday.text);
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  _FormSection(
                                    controller: _cHoroscope,
                                    title: 'Horoscope:',
                                    hint: '--',
                                    readOnly: true,
                                  ),
                                  const SizedBox(height: 12),
                                  _FormSection(
                                    controller: _cZodiac,
                                    title: 'Zodiac',
                                    hint: '--',
                                    readOnly: true,
                                  ),
                                  const SizedBox(height: 12),
                                  _FormSection(
                                    controller: _cHeight,
                                    title: 'Height',
                                    hint: 'Add height',
                                    readOnly: false,
                                  ),
                                  const SizedBox(height: 12),
                                  _FormSection(
                                    controller: _cWeight,
                                    title: 'Weight',
                                    hint: 'Add weight',
                                    readOnly: false,
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(height: 10)
                    ],
                  ),
                )
              : const AboutShimmer();
        },
      ),
    );
  }
}
