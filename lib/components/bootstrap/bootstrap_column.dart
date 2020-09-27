import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class BSColumn extends StatefulWidget {
  final List<Widget> children;
  final Color backgroundColor;
  final double height;
  final double width;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;

  BSColumn({
    this.children,
    this.backgroundColor,
    this.height,
    this.width,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.padding,
  });

  @override
  _BSColumnState createState() => _BSColumnState();
}

class _BSColumnState extends State<BSColumn> {
  ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      ScreenManager().calculateScreenType(screenWidth);
      screenType = ScreenManager.screenType;
      return Container(
        padding: widget.padding,
        height: widget.height,
        width: widget.width,
        color: widget.backgroundColor ?? Theme.of(context).backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: widget.mainAxisAlignment,
          children: widget.children,
        ),
      );
    });
  }
}
