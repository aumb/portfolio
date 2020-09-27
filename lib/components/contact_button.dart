import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class ContactButton extends StatefulWidget {
  final IconData icon;
  final bool disabled;
  final bool isLoading;
  final double size;
  final Function onPressed;

  const ContactButton({
    this.icon,
    this.disabled = false,
    this.size = 24,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  Color backgroundColor = CustomColors.accentColor;
  Color iconColor = CustomColors.cardColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHover) {
        if (isHover) {
          setState(() {
            backgroundColor = CustomColors.cardColor;
            iconColor = CustomColors.accentColor;
          });
        } else {
          setState(() {
            backgroundColor = CustomColors.accentColor;
            iconColor = CustomColors.cardColor;
          });
        }
      },
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      onTap: (widget.disabled ?? false)
          ? null
          : widget.isLoading
              ? () {}
              : widget.onPressed,
      child: Container(
        width: widget.size ?? 24,
        height: widget.size ?? 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: iconColor, width: 1),
        ),
        child: Icon(
          widget.icon,
          size: widget.size - 12,
          color: iconColor,
        ),
      ),
    );
  }
}
