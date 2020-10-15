import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons/custom_rasied_button.dart';
import 'package:portfolio/components/custom_dialog.dart';
import 'package:portfolio/components/textfields/custom_text_field.dart';
import 'package:portfolio/core/core.dart';

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: [
        _buildAccent(),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 24, top: 19),
          child: Text(
            Strings.login,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomTextField(
            labelText: Strings.email,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomTextField(
            labelText: Strings.password,
          ),
        ),
        SizedBox(height: 32),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomRaisedButton(
            label: Strings.loginButton.toUpperCase(),
            onPressed: () {},
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Container _buildAccent() {
    return Container(height: 5, color: Theme.of(context).accentColor);
  }
}
