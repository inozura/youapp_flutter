import 'package:flutter/material.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/styles.dart';
import 'package:youapp_test/core/widgets/widgets.dart';

class DropDown<T> extends StatefulWidget {
  const DropDown({
    super.key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
    this.hintIsVisible = false,
    this.prefixIcon,
    this.width,
    this.heightField,
    this.borderColor,
    this.backgroundColor,
    this.prefixText,
    this.suffixIcon,
    this.hintText,
  });
  final T value;
  final List<DropdownMenuItem<T>> items;
  final bool hintIsVisible;
  final String? hint;
  final ValueChanged<T?>? onChanged;
  final Widget? prefixIcon;
  final double? width;
  final double? heightField;
  final Color? borderColor;
  final Color? backgroundColor;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? hintText;

  @override
  _DropDownState<T> createState() => _DropDownState();
}

class _DropDownState<T> extends State<DropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hintIsVisible) ...{
            Text(
              widget.hint ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
            SpacerV(value: Dimens.space6),
          },
          ButtonTheme(
            key: widget.key,
            alignedDropdown: true,
            child: DropdownButtonFormField<T>(
              alignment: FractionalOffset.bottomCenter,
              dropdownColor: Theme.of(context).extension<LzyctColors>()!.card,
              icon: const Icon(Icons.arrow_drop_down),
              decoration: InputDecoration(
                prefixText: widget.prefixText,
                filled: widget.backgroundColor != null ? true : false,
                fillColor: widget.backgroundColor,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                suffixIcon: widget.suffixIcon,
                contentPadding: EdgeInsets.symmetric(
                  vertical: widget.heightField ?? Dimens.space12,
                  horizontal: Dimens.space2,
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space8),
                  borderSide: BorderSide(
                    color: widget.borderColor ??
                        Theme.of(context).extension<LzyctColors>()!.subtitle!,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space8),
                  borderSide: BorderSide(
                      color: Theme.of(context).extension<LzyctColors>()!.sky!),
                ),
                errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).extension<LzyctColors>()!.red,
                    ),
                focusedErrorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space8),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<LzyctColors>()!.red!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space8),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<LzyctColors>()!.red!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.circular(Dimens.space8),
                  borderSide: BorderSide(
                    color: Theme.of(context).extension<LzyctColors>()!.sky!,
                  ),
                ),
              ),
              value: widget.value,
              items: widget.items,
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
