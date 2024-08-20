import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/controllers/modules/chat_inq_page_controller.dart';

class ChatInqPage extends GetView<ChatInqPageController> {
  const ChatInqPage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutStyle.init(context);

    return GetBuilder<ChatInqPageController>(
      tag: 'homePage',
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Container(
          width: layoutStyle.screenWidth,
          height: layoutStyle.screenHeight,
          child: Text('Chat Inq'),
        );
      },
    );
  }
}
