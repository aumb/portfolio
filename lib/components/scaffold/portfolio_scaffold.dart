import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/scaffold/loading_animation.dart';
import 'package:portfolio/core/core.dart';

class PortfolioScaffold extends StatefulWidget {
  /// Extras:
  ///  - Handles different [PageState] widgets using `state`
  ///  - Handles search bar
  PortfolioScaffold({
    Key key,
    this.scaffoldKey,
    this.appBar,
    this.builder,
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

  final Key scaffoldKey;
  final PreferredSizeWidget appBar;
  final WidgetBuilder builder;
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

  static PortfolioScaffoldState of(BuildContext context,
      {bool nullOk = false}) {
    final PortfolioScaffoldState result = context.findAncestorStateOfType();
    return result;
  }

  @override
  PortfolioScaffoldState createState() => PortfolioScaffoldState();
}

class PortfolioScaffoldState extends State<PortfolioScaffold> {
  Widget _requestedAppbar;
  bool _showBlur = false;

  void requestAppBarRefresh(PreferredSizeWidget appbar,
      {AppState appState, bool forceAppbar = false}) {
    bool hadAppbar = _requestedAppbar != null;
    bool requestingAppbar = appbar != null;
    if (hadAppbar != requestingAppbar) refreshState();
    if (forceAppbar)
      _requestedAppbar = appbar;
    else
      _requestedAppbar = null;
  }

  void refreshState() {
    var state = PortfolioScaffold.of(context);
    if (state != null) {
      state.refreshState();
    } else {
      Future.delayed(Duration(milliseconds: 16)).then((_) {
        if (mounted)
          setState(() {
            _requestedAppbar = _requestedAppbar;
          });
        else
          refreshState();
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget pageBody = SizedBox.shrink();
    switch (widget.state.pageState) {
      case PageState.loading:
        pageBody =
            Container(width: 300, height: 300, child: LoadingAnimation());
        break;
      case PageState.loaded:
        if (widget.builder != null) {
          pageBody = Builder(
            builder: widget.builder,
          );
        }
        break;
      case PageState.error:
        break;
      case PageState.noData:
        break;
    }

    Widget scaffold = Scaffold(
      key: widget.scaffoldKey,
      appBar: widget.appBar,
      body: AbsorbPointer(
        absorbing: widget.disablePointer,
        child: Stack(
          children: [
            SizedBox.expand(child: pageBody),
          ],
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
    );

    return scaffold;
  }

  void toggleBlur() {
    if (mounted)
      setState(() {
        _showBlur = !_showBlur;
      });
  }
}
