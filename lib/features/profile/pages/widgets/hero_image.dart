import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/palette.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_image_cubit.dart';
import 'package:youapp_test/utils/helper/calculation.dart';
import 'package:youapp_test/utils/utils.dart';

class HeroImage extends StatefulWidget {
  final Profile? profile;

  const HeroImage({super.key, this.profile});

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  late String? imageProfile = null;
  final Convert _convert = Convert();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileImageCubit, ProfileImageState>(
      listener: (context, state) {
        state.when(
            loading: () {},
            success: (profileImage) {
              setState(() {
                imageProfile = profileImage?.data;
              });
            },
            failure: (error) {
              'Failure to fecth image'.toString().toToastError(context);
            },
            empty: () {});
      },
      child: Container(
        key: widget.key,
        width: double.infinity,
        height: Dimens.menuContainer,
        padding: EdgeInsets.all(Dimens.space12),
        decoration: BoxDecoration(
            color: Palette.backgroundCard,
            borderRadius: BorderRadius.all(Radius.circular(Dimens.space16)),
            image: imageProfile != null
                ? DecorationImage(
                    image: MemoryImage(
                        Uri.parse(imageProfile ?? '').data!.contentAsBytes()),
                    fit: BoxFit.cover)
                : null),
        child: widget.profile != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "@${widget.profile?.data?.displayName}, ${widget.profile?.data?.date != null ? _convert.age(widget.profile!.data!.date!) : ''}",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  if (widget.profile?.data?.date != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${widget.profile?.data?.date}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                ],
              )
            : null,
      ),
    );
  }
}
