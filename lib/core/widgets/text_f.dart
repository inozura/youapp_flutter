import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youapp_test/core/resources/dimens.dart';
import 'package:youapp_test/core/resources/palette.dart';
import 'package:youapp_test/core/resources/styles.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.curFocusNode,
    this.nextFocusNode,
    this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
    this.semantic,
    this.width,
    this.heightField,
    this.borderColor,
    this.backgroundColor,
  });

  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? hint;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final String? semantic;
  final double? width;
  final double? heightField;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isHintVisible,
            child: Text(
              widget.hint ?? "",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Color.fromARGB(6, 255, 255, 255),
                    height: 0.1,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: Dimens.space4),
            child: Semantics(
              label: widget.semantic,
              child: TextFormField(
                key: widget.key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofillHints: widget.autofillHints,
                enabled: widget.enable,
                obscureText: widget.obscureText ?? false,
                focusNode: widget.curFocusNode,
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                textAlign: widget.textAlign ?? TextAlign.start,
                minLines: widget.minLine ?? 1,
                maxLines: widget.maxLine ?? 10,
                inputFormatters: widget.inputFormatter,
                textAlignVertical: TextAlignVertical.center,
                style: Theme.of(context).textTheme.bodyMedium,
                cursorColor: Palette.text,
                decoration: InputDecoration(
                  prefixText: widget.prefixText,
                  alignLabelWithHint: true,
                  isDense: true,
                  filled: widget.backgroundColor != null ? true : false,
                  fillColor: widget.backgroundColor,
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  suffixIcon: widget.suffixIcon,
                  prefixIconConstraints: BoxConstraints(
                    minHeight: Dimens.space24,
                    maxHeight: Dimens.space24,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: widget.heightField ?? Dimens.space12,
                    horizontal: Dimens.space16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space8),
                    borderSide: BorderSide(
                      color: widget.borderColor ??
                          Theme.of(context).extension<LzyctColors>()!.card!,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(Dimens.space8),
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).extension<LzyctColors>()!.sky!),
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
                validator: widget.validator as String? Function(String?)?,
                onChanged: widget.onChanged,
                onTap: widget.onTap as void Function()?,
                onFieldSubmitted: (value) {
                  setState(() {
                    fieldFocusChange(
                      context,
                      widget.curFocusNode ?? FocusNode(),
                      widget.nextFocusNode,
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
