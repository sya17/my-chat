import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/common/fire_auth_util.dart';
import 'package:tektok/presentation/components/customs/custom_alert.dart';

class LoginPageController extends GetxController {
  LoginPageController();

  final noTelpController = TextEditingController();

  login() async {
    if (noTelpController.text.isNotEmpty) {
      await fireAuthUtil.verifyPhoneNumber(noTelpController.text);
    } else {
      alert.error('Error', 'No Telp Must be empty');
    }
  }

  doRedirectOtpPage(String verificationId) {
    Get.to(
      RouteName.verificationOtpPage,
      arguments: {
        "verificationId": verificationId,
      },
    );
  }
}
