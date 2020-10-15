import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/core.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final bool autocorrect;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Widget prefix;
  final TextInputType keyboardType;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final bool autofocus;
  final bool enableInteractiveSelection;
  final GestureTapCallback onTap;
  final bool enabled;
  final TextAlign textAlign;
  final String errorText;
  final String counterText;
  final String helperText;
  final bool expanded;
  final int maxLines;
  final int minLines;
  final EdgeInsets contentPadding;
  final TextAlignVertical textAlignVertical;
  final Widget suffix;
  final double radius;
  final Widget Function(BuildContext,
      {int currentLength, bool isFocused, int maxLength}) buildCounter;
  final Color fillColor;
  final bool isSmsListener;
  final bool showCounter;

  const CustomTextField({
    Key key,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.controller,
    this.autocorrect = true,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.inputFormatters,
    this.textInputAction,
    this.autofocus = false,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.counterText,
    this.helperText,
    this.expanded = false,
    this.maxLines = 1,
    this.minLines,
    this.contentPadding,
    this.textAlignVertical,
    this.suffix,
    this.radius = 4,
    this.buildCounter,
    this.fillColor,
    this.isSmsListener = false,
    this.showCounter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      expands: expanded,
      controller: controller,
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      enabled: enabled,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        prefix: prefix,
        suffixIcon: suffixIcon,
        suffix: suffix,
        contentPadding: contentPadding,
        fillColor:
            enabled ? fillColor : Theme.of(context).scaffoldBackgroundColor,
        errorText: errorText,
        counterText: showCounter ? counterText : '',
        helperText: helperText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.accentColor,
          ),
        ),
      ),
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      autofocus: autofocus,
      enableInteractiveSelection: enableInteractiveSelection,
      onTap: onTap,
      buildCounter: !showCounter
          ? (context, {currentLength, isFocused, maxLength}) {
              return SizedBox.shrink();
            }
          : buildCounter,
    );
  }
}
