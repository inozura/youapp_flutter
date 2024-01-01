import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_image_cubit.dart';
import 'package:youapp_test/features/profile/pages/widgets/about_card.dart';
import 'package:youapp_test/features/profile/pages/widgets/hero_image.dart';
import 'package:youapp_test/core/widgets/widgets.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_cubit.dart';
import 'package:youapp_test/utils/utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isLoading = true;
  Profile? _profile = null;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
    context.read<ProfileImageCubit>().fetchProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
        child: BlocListener<ProfileCubit, ProfileState>(
            listener: (_, state) {
              state.when(
                loading: () => {},
                success: (response) async {
                  if (response?.data != null) {
                    setState(() {
                      _profile = response;
                    });

                    // if (response?.data?.image != null)
                    //   context.read<ProfileImageCubit>().fetchProfileImage();
                  }
                },
                failure: (message) {
                  'Failure to fetch data'.toToastError(context);
                },
                empty: () async {
                  setState(() {
                    _profile = null;
                  });
                },
              );
            },
            child: SafeArea(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                      padding: EdgeInsets.all(Dimens.space8),
                      child: Column(
                        children: [
                          HeroImage(
                            profile: _profile,
                          ),
                          SpacerV(
                            value: Dimens.space24,
                          ),
                          AboutCard(
                            profile: _profile,
                          ),
                        ],
                      ))),
            )));
  }
}
