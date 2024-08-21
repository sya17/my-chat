import 'package:get/get.dart';
import 'package:tektok/presentation/controllers/auth/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
