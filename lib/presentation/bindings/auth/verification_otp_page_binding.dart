import 'package:get/get.dart';
import 'package:tektok/presentation/controllers/auth/verification_otp_page_controller.dart';

class VerificationOtpPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationOtpPageController>(
        () => VerificationOtpPageController());
  }
}
