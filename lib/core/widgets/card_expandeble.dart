import 'package:flutter/material.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/palette.dart';

class CardExpandeble extends StatefulWidget {
  final Widget child;
  const CardExpandeble({super.key, required this.child});

  @override
  State<CardExpandeble> createState() => _CardExpandebleState();
}

class _CardExpandebleState extends State<CardExpandeble> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
      child: Container(
        padding: EdgeInsets.only(
            left: Dimens.space24,
            top: Dimens.space16,
            right: Dimens.space24,
            bottom: Dimens.space16),
        decoration: BoxDecoration(
          color: Palette.card,
          borderRadius: BorderRadius.all(Radius.circular(Dimens.space16)),
        ),
        child: widget.child,
      ),
    );
  }
}
