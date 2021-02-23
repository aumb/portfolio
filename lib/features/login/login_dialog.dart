import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons/custom_rasied_button.dart';
import 'package:portfolio/components/custom_dialog.dart';
import 'package:portfolio/components/textfields/custom_text_field.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/cms/cms_screen.dart';

class LoginDialog extends StatefulWidget {
  final HomeController controller;

  const LoginDialog({this.controller});

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  LoginController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _controller.canLoginStream,
        builder: (context, snapshot) {
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
                  onChanged: (v) => _controller.email = v,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  labelText: Strings.password,
                  onChanged: (v) => _controller.password = v,
                ),
              ),
              SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomRaisedButton(
                  disabled: !_controller.canLogin,
                  isLoading: _controller.isLoading,
                  label: Strings.loginButton.toUpperCase(),
                  onPressed: () => _controller.login().then((value) async {
                    Navigator.pop(context);
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => CmsScreen(
                          information: widget.controller.information,
                        ),
                      ),
                    );
                    widget.controller.getInformation();
                  }).catchError((e) {
                    print(e);
                  }),
                ),
              ),
              SizedBox(height: 16),
            ],
          );
        });
  }

  Container _buildAccent() {
    return Container(height: 5, color: Theme.of(context).accentColor);
  }
}
