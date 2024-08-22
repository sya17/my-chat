import 'dart:async';

import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/common/fire_auth_util.dart';
// import 'package:tektok/app/utils/common/session_util.dart';
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

  doCheckSession() async {
    bool isAvailable = await fireAuthUtil.checkUserAvailable();
    // if (sessionUtil.isActive()) {
    if (isAvailable) {
      final controller = Get.put(LoginPageController());
      controller.login();
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
