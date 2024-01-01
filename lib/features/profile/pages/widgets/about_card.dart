import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/core/widgets/card_expandeble.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/pages/cubit/post_profile_cubit.dart';
import 'package:youapp_test/features/profile/pages/widgets/about_editor.dart';
import 'package:youapp_test/utils/utils.dart';

class AboutCard extends StatefulWidget {
  final Profile? profile;

  const AboutCard({super.key, required this.profile});

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool isEditing = false;
  GlobalKey<AboutEditorState> aboutEditorState = GlobalKey<AboutEditorState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostProfileCubit, PostProfileState>(
      listener: (context, state) {
        state.when(
            loading: () => context.show(),
            success: (response) async {
              context.dismiss();

              if (response?.success != null) {
                'Success update profile'.toToastSuccess(context);
              }
              setState(() {
                isEditing = false;
              });
            },
            failure: (message) {
              context.dismiss();

              message.toToastError(context);
            },
            empty: () {});
      },
      child: CardExpandeble(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              isEditing
                  ? ButtonText(
                      title: widget.profile != null
                          ? "Save & Update"
                          : "Create Profile",
                      titleColor: Palette.flamingoMocha,
                      fontSize:
                          Theme.of(context).textTheme.titleSmall!.fontSize,
                      onPressed: () {
                        if (widget.profile != null) {
                          aboutEditorState.currentState?.handleCreateProfil();
                        } else {
                          aboutEditorState.currentState?.handleCreateProfil();
                        }
                      })
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                        size: Dimens.bodyLarge,
                        color: Palette.flamingoMocha,
                      )),
            ],
          ),
          isEditing
              ? AboutEditor(
                  key: aboutEditorState,
                  profile: widget.profile?.data,
                )
              : Text(
                  "Add in your your to help others know you better",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Palette.subText),
                )
        ],
      )),
    );
  }
}
