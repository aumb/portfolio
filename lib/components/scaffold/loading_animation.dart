import 'package:flutter/material.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:portfolio/core/core.dart';

class LoadingAnimation extends StatefulWidget {
  @override
  _LogoLoadingAnimationState createState() => new _LogoLoadingAnimationState();
}

class _LogoLoadingAnimationState extends State<LoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return FlareActor(
      Images.loader,
      alignment: Alignment.center,
      animation: 'Untitled',
    );
  }
}
