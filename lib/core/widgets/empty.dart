import 'package:flutter/material.dart';
import 'package:youapp_test/core/resources/resources.dart';
import 'package:youapp_test/utils/utils.dart';

class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.icLauncher,
          width: context.widthInPercent(45),
        ),
        Text(
          errorMessage ?? '',
        ),
      ],
    );
  }
}
