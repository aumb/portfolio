import 'package:portfolio/core/core.dart';

class ScreenManager {
  static ScreenType screenType;

  void calculateScreenType(double width) {
    if (width <= 480) {
      screenType = ScreenType.xsmall;
    } else if (width >= 481 && width <= 768) {
      screenType = ScreenType.small;
    } else if (width >= 769 && width <= 1024) {
      screenType = ScreenType.medium;
    } else if (width >= 1025 && width <= 1200) {
      screenType = ScreenType.large;
    } else {
      screenType = ScreenType.xlarge;
    }
  }

  double calculateMaxWidth() {
    switch (screenType) {
      case ScreenType.xsmall:
      case ScreenType.small:
        return 540;
      case ScreenType.medium:
        return 720;
      case ScreenType.large:
        return 500;
      case ScreenType.xlarge:
        return 1000;
      default:
        return 1140;
    }
  }
}
