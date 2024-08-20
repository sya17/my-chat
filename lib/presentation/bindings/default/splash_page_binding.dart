import 'package:get/get.dart';
import 'package:tektok/presentation/controllers/default/splash_page_controller.dart';

class SplashPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashPageController>(() => SplashPageController());
  }
}
