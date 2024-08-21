import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tektok/app/utils/common/fire_auth_util.dart';
import 'package:tektok/app/utils/common/logger_util.dart';

class LoginPageController extends GetxController {
  LoginPageController();

  final noTelpController = TextEditingController();
  final otpController = TextEditingController();

  sendOtp() async {
    if (noTelpController.text.isNotEmpty) {
      logger.safeLog('AUTH PHONE : ${noTelpController.text}');
      // await fireAuthUtil.sendOTP(noTelpController.text);
      await fireAuthUtil.verifyPhoneNumber(noTelpController.text);
    }
  }
}
