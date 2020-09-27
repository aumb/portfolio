import 'package:flutter/material.dart';
import 'package:portfolio/components/scaffold/portfolio_scaffold.dart';
import 'package:portfolio/core/core.dart';

class BSScaffold extends StatefulWidget {
  final Key scaffoldKey;
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final FloatingActionButtonAnimator floatingActionButtonAnimator;
  final List<Widget> persistentFooterButtons;
  final Widget drawer;
  final Widget endDrawer;
  final Color backgroundColor;
  final Widget bottomNavigationBar;
  final Widget bottomSheet;
  final bool resizeToAvoidBottomInset;
  final bool primary;
  final AppState state;
  final bool disablePointer;
  final bool forceAppBar;
  final String textUnderLoader;
  final bool extendBodyBehindAppBar;
  final dynamic error;

  BSScaffold({
    Key key,
    this.scaffoldKey,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.primary = true,
    this.state = const AppState(),
    this.disablePointer = false,
    this.forceAppBar = false,
    this.textUnderLoader,
    this.extendBodyBehindAppBar = false,
    this.error,
  })  : assert(primary != null),
        super(key: key);

  @override
  _BSScaffoldState createState() => _BSScaffoldState();
}

class _BSScaffoldState extends State<BSScaffold> {
  ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double screenWidth = constraints.maxWidth;
        ScreenManager().calculateScreenType(screenWidth);
        screenType = ScreenManager.screenType;
        return PortfolioScaffold(
          backgroundColor: widget.backgroundColor,
          appBar: widget.appBar,
          builder: (BuildContext context) => Center(
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: ScreenManager().calculateMaxWidth()),
              child: widget.body,
            ),
          ),
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          disablePointer: widget.disablePointer,
          drawer: widget.drawer,
          endDrawer: widget.endDrawer,
          error: widget.error,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          floatingActionButton: widget.floatingActionButton,
          floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          forceAppBar: widget.forceAppBar,
          key: widget.key,
          persistentFooterButtons: widget.persistentFooterButtons,
          primary: widget.primary,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          scaffoldKey: widget.scaffoldKey,
          state: widget.state,
          textUnderLoader: widget.textUnderLoader,
        );
      },
    );
  }
}
