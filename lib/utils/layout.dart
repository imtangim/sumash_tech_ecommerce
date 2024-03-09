import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout {
  final BuildContext context;

  AppLayout({required this.context});
  getSize() {
    return MediaQuery.of(context).size;
  }

  getScreenHeight() {
    return context.mediaQuerySize.height;
  }

  getScreenWidth() {
    return context.mediaQuerySize.height;
  }

  getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  getwidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}