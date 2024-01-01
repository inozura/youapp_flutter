import 'package:flutter/material.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/palette.dart';
import 'package:youapp_test/core/resources/styles.dart';
import 'package:youapp_test/utils/utils.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minWidth: width ?? context.widthInPercent(100)),
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      height: Dimens.buttonH,
      decoration: BoxDecorations(context).button.copyWith(
            color: color ?? Theme.of(context).extension<LzyctColors>()!.sky,
          ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              color ?? Theme.of(context).extension<LzyctColors>()!.sky,
          foregroundColor: Theme.of(context).extension<LzyctColors>()!.sky,
          padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimens.cornerRadius),
            ),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).extension<LzyctColors>()!.buttonText,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
