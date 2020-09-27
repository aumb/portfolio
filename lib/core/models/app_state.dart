import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AppState {
  final PageState pageState;

  /// to show no data default widget, if null doesn't appear
  final String noDataMessage;

  /// when an error is showing, a retry button will be display
  final VoidCallback onRetry;

  const AppState({
    this.pageState = PageState.loaded,
    this.noDataMessage = '',
    this.onRetry,
  });
}
