import 'package:flutter/material.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/styles.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final TextStyle? textStyle;
  final double? verticalMargin;
  final double? horizontalMargin;

  const ButtonText({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    this.textStyle,
    this.verticalMargin,
    this.horizontalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin ?? Dimens.space8,
          horizontal: horizontalMargin ?? 0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).extension<LzyctColors>()!.sky,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(
                fontSize: fontSize != null
                    ? fontSize
                    : Theme.of(context).textTheme.labelLarge!.fontSize,
                color: titleColor != null
                    ? titleColor
                    : Theme.of(context).textTheme.labelLarge!.color,
              )
              .merge(textStyle),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
