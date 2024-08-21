import 'dart:async';

import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/common/session_util.dart';
import 'package:tektok/presentation/controllers/auth/login_page_controller.dart';

class SplashPageController extends GetxController {
  SplashPageController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Future.delayed(Duration(seconds: 2), () {
    //   Get.toNamed(RouteName.homePage);
    // });
    doCheckSession();
  }

  doCheckSession() {
    if (sessionUtil.isActive()) {
      final controller = Get.put(LoginPageController());
      // controller.inpUsername.text = sessionUtil.getSession().username ?? "";
      // controller.inpPassword.text = sessionUtil.getSession().password ?? "";
      // controller.doSignIn(fromSplash: true);
    } else {
      Timer(const Duration(seconds: 2), () {
        Get.offAllNamed(
          RouteName.loginPage,
        );
      });
    }
    update();
  }
}
