import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tektok/presentation/bindings/default/home_page_binding.dart';
import 'package:tektok/presentation/bindings/default/splash_page_binding.dart';
import 'package:tektok/presentation/views/default/home_page.dart';
import 'package:tektok/presentation/views/default/splash_page.dart';

class AppRoute {
  static final pages = [
    GetPage(
      name: RouteName.splashPage,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.homePage,
      page: () => const HomePage(),
      binding: HomePageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

abstract class RouteName {
  static const splashPage = '/';
  static const homePage = '/homePage';
}
