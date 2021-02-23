import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons/custom_rasied_button.dart';

class DialogLoadingButton extends StatefulWidget {
  final Future Function() future;
  final String label;
  final bool disabled;
  final Color backgroundColor;

  const DialogLoadingButton({
    this.future,
    this.label,
    this.disabled,
    this.backgroundColor,
  });

  @override
  _DialogLoadingButtonState createState() => _DialogLoadingButtonState();
}

class _DialogLoadingButtonState extends State<DialogLoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomRaisedButton(
        backgroundColor: widget.backgroundColor,
        label: widget.label,
        isLoading: _isLoading,
        disabled: widget.disabled ?? false,
        onPressed: () async {
          if (mounted)
            setState(() {
              _isLoading = true;
            });
          await widget.future();
          if (mounted)
            setState(() {
              _isLoading = false;
            });
        },
      ),
    );
  }
}
