import 'package:get/get.dart';
import 'package:tektok/presentation/controllers/default/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
