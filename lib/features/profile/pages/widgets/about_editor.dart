import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:youapp_test/features/profile/data/models/profile_response.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';
import 'package:youapp_test/features/profile/pages/cubit/post_profile_cubit.dart';

class AboutEditor extends StatefulWidget {
  final DataProfile? profile;

  const AboutEditor({
    super.key,
    this.profile,
  });

  @override
  State<AboutEditor> createState() => AboutEditorState();
}

class AboutEditorState extends State<AboutEditor> {
  // State
  MultipartFile? imageFile = null;

  /// Controller
  final _conUsername = TextEditingController();
  final _conGender = TextEditingController();
  final _conBirthday = TextEditingController();
  final _conHeroscope = TextEditingController();
  final _conZodiac = TextEditingController();
  final _conHeight = TextEditingController();
  final _conWeight = TextEditingController();

  /// Focus Node
  final _fnUsername = FocusNode();
  final _fnBirthday = FocusNode();
  final _fnHeroscope = FocusNode();
  final _fnZodiac = FocusNode();
  final _fnHeight = FocusNode();
  final _fnWeight = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  void handleCreateProfil() {
    if (_keyForm.currentState?.validate() ?? false) {
      context.read<PostProfileCubit>().postProfileImage(
            PostProfileParams(
              displayName: _conUsername.text,
              gender: _conGender.text,
              birtday: _conBirthday.text,
              heroscope: _conHeroscope.text,
              zodiac: _conZodiac.text,
              height: _conHeight.text != '' ? int.parse(_conHeight.text) : 0,
              weight: _conHeight.text != '' ? int.parse(_conWeight.text) : 0,
              // image: imageFile,
            ),
          );
    }
  }

  Future<void> imagePicker() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   allowMultiple: false,
    //   type: FileType.image,
    // );

    // if (result != null) {
    //   imageFile = await MultipartFile.fromFile(result.files.single.path!);
    // }
  }

  void initialValue() {
    if (widget.profile?.displayName != null)
      _conUsername.text = widget.profile!.displayName!;
    if (widget.profile?.gender != null)
      _conGender.text = widget.profile!.gender!;
    if (widget.profile?.date != null) _conBirthday.text = widget.profile!.date!;
    if (widget.profile?.heroscope != null)
      _conHeroscope.text = widget.profile!.heroscope!;
    if (widget.profile?.zodiac != null)
      _conZodiac.text = widget.profile!.zodiac!;
    if (widget.profile?.height != null)
      _conHeight.text = widget.profile!.height!.toString();
    if (widget.profile?.weight != null)
      _conWeight.text = widget.profile!.weight!.toString();
  }

  @override
  void initState() {
    super.initState();

    this.initialValue();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _keyForm,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    imagePicker();
                  },
                  child: Container(
                    width: Dimens.space50,
                    height: Dimens.space50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.space16),
                        color: Palette.backgroundTransparent),
                    child: Icon(Icons.add, color: Palette.flamingoMocha),
                  ),
                ),
                SpacerH(value: Dimens.space12),
                Text("Add Image", style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
            SpacerV(value: Dimens.space24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Display Name:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("username"),
                  curFocusNode: _fnUsername,
                  nextFocusNode: _fnBirthday,
                  controller: _conUsername,
                  keyboardType: TextInputType.name,
                  hintText: 'Enter name',
                  hint: 'Enter name',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                  validator: (String? value) => value != null
                      ? (value.length < 4
                          ? 'Username must be at least 4 characters'
                          : null)
                      : null,
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Gender:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                DropDown(
                  key: const Key('gender'),
                  width: 200,
                  heightField: Dimens.space2,
                  items: [
                    DropdownMenuItem(
                      child: Text(
                        "Male",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      ),
                      value: 'male',
                    ),
                    DropdownMenuItem(
                      child: Text(
                        "Famale",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      ),
                      value: 'famale',
                    ),
                  ],
                  value: (!widget.profile!.gender!.isEmpty)
                      ? widget.profile!.gender!
                      : 'male',
                  onChanged: (String? value) {
                    _conGender.text = value ?? '';
                  },
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Birthday:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("birthday"),
                  curFocusNode: _fnBirthday,
                  nextFocusNode: _fnBirthday,
                  controller: _conBirthday,
                  keyboardType: TextInputType.none,
                  hintText: 'DD MM YYYY',
                  hint: 'DD MM YYYY',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      _conBirthday.text = formattedDate;
                    }
                  },
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Herosope:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("heroscope"),
                  curFocusNode: _fnHeroscope,
                  nextFocusNode: _fnZodiac,
                  controller: _conHeroscope,
                  keyboardType: TextInputType.name,
                  hintText: '--',
                  hint: '--',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Zodiac:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("zodiac"),
                  curFocusNode: _fnZodiac,
                  nextFocusNode: _fnHeight,
                  controller: _conZodiac,
                  keyboardType: TextInputType.name,
                  hintText: '--',
                  hint: '--',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Height:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("height"),
                  curFocusNode: _fnHeight,
                  nextFocusNode: _fnWeight,
                  controller: _conHeight,
                  keyboardType: TextInputType.name,
                  hintText: 'Height (cm)',
                  hint: 'Height (cm)',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                ),
              ],
            ),
            SpacerV(value: Dimens.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Weight:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Palette.subText)),
                TextF(
                  key: const Key("weight"),
                  curFocusNode: _fnWeight,
                  controller: _conWeight,
                  keyboardType: TextInputType.name,
                  hintText: 'Weight (kg)',
                  hint: 'Weight (kg)',
                  width: 200,
                  heightField: Dimens.space10,
                  isHintVisible: false,
                  borderColor:
                      Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  backgroundColor:
                      Theme.of(context).extension<LzyctColors>()!.background,
                ),
              ],
            ),
          ],
        ));
  }
}
