import 'package:flutter/material.dart';

class Helper {
  static double? getWidgetHeight(BuildContext? context) {
    final renderBox = context?.findRenderObject() as RenderBox?;
    return (renderBox != null && renderBox.hasSize) ? renderBox.size.height : null;
  }

  static double calculateAvailableHeight(BuildContext context,double headerHeight) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final statusBarHeight = mediaQuery.padding.top;

    const appBarHeight = kToolbarHeight;
    const tabBarHeight = kToolbarHeight;

    return screenHeight - statusBarHeight - appBarHeight - tabBarHeight - headerHeight;
  }

}