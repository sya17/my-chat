import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tektok/presentation/bindings/auth/login_page_binding.dart';
import 'package:tektok/presentation/bindings/auth/register_page_binding.dart';
import 'package:tektok/presentation/bindings/auth/verification_otp_page_binding.dart';
import 'package:tektok/presentation/bindings/default/home_page_binding.dart';
import 'package:tektok/presentation/bindings/default/splash_page_binding.dart';
import 'package:tektok/presentation/bindings/modules/chat_inq_page_binding.dart';
import 'package:tektok/presentation/views/auth/login_page.dart';
import 'package:tektok/presentation/views/auth/register_page.dart';
import 'package:tektok/presentation/views/auth/verification_otp_page.dart';
import 'package:tektok/presentation/views/default/home_page.dart';
import 'package:tektok/presentation/views/default/splash_page.dart';
import 'package:tektok/presentation/views/modules/chat_inq_page.dart';

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
      name: RouteName.loginPage,
      page: () => const LoginPage(),
      binding: LoginPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      children: contentPages,
    ),
    GetPage(
      name: RouteName.registerPage,
      page: () => const RegisterPage(),
      binding: RegisterPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      children: contentPages,
    ),
    GetPage(
      name: RouteName.verificationOtpPage,
      page: () => const VerificationOtpPage(),
      binding: VerificationOtpPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      children: contentPages,
    ),
    GetPage(
      name: RouteName.homePage,
      page: () => const HomePage(),
      binding: HomePageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      children: contentPages,
    ),
  ];

  static final contentPages = [
    GetPage(
      name: RouteName.chatInq,
      page: () => const ChatInqPage(),
      binding: ChatInqPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.newChat,
      page: () => const Text('new chat'),
      // binding: SplashPageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.newContact,
      page: () => const Text('new contact'),
      // binding: HomePageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RouteName.newCommunity,
      page: () => const Text('new community'),
      // binding: HomePageBinding(),
      curve: Curves.linear,
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}

abstract class RouteName {
  static const splashPage = '/';
  static const loginPage = '/loginPage';
  static const registerPage = '/registerPage';
  static const verificationOtpPage = '/verificationOtpPage';
  static const homePage = '/homePage';

  static const chatInq = '/chat';
  static const newChat = '/new-chat';
  static const newContact = '/new-contact';
  static const newCommunity = '/new-community';
}
