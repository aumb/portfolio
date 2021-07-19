import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  //tEST
  final String label;

  final VoidCallback onPressed;

  final bool disabled;
  final bool isLoading;

  final Color backgroundColor;
  final Color textColor;
  final Color disabledColor;

  final Widget child;

  const CustomRaisedButton({
    this.onPressed,
    this.label,
    this.disabled = false,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.disabledColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      disabledColor: disabledColor ?? Colors.grey,
      color: backgroundColor ?? Theme.of(context).accentColor,
      elevation: disabled ? 0.0 : null,
      child: child ?? isLoading
          ? Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).accentColor),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : Text(
              label ?? '',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: textColor ?? null),
            ),
      onPressed: (disabled ?? false)
          ? null
          : isLoading
              ? () {}
              : onPressed,
    );
  }
}
