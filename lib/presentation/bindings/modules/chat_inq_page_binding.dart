import 'package:get/get.dart';
import 'package:tektok/presentation/controllers/modules/chat_inq_page_controller.dart';

class ChatInqPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatInqPageController>(() => ChatInqPageController());
  }
}
