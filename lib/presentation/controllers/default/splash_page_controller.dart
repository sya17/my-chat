import 'package:get/get.dart';
import 'package:tektok/app/main/app_route.dart';

class SplashPageController extends GetxController {
  SplashPageController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(RouteName.homePage);
    });
  }
}
