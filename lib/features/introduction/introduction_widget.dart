import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/introduction/profile_picture.dart';
import 'package:portfolio/features/login/login_dialog.dart';

class IntroductionWidget extends StatefulWidget {
  final Information information;

  const IntroductionWidget({this.information});

  @override
  _IntroductionWidgetState createState() => _IntroductionWidgetState();
}

class _IntroductionWidgetState extends State<IntroductionWidget> {
  int pictureTaps;
  @override
  void initState() {
    super.initState();
    pictureTaps = 0;
  }

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.height;
    return BSColumn(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      height: size,
      children: [
        SizedBox(height: 56),
        Text(
          widget.information?.personalInformation?.jobTitle ?? '',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        Text(
          widget.information?.personalInformation?.jobSubtitle,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 56),
        InkWell(
          onTap: () => _toggleDialog(context),
          mouseCursor: MouseCursor.defer,
          child: ProfilePicture(
              size: 150, information: widget.information?.personalInformation),
        ),
        SizedBox(height: 32),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.illustraion,
                width: 600,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _toggleDialog(BuildContext context) {
    // pictureTaps++;
    // if (pictureTaps >= 10) {
    showDialog(
      context: context,
      builder: (BuildContext context) => LoginDialog(),
    );
  }
  //}
}
