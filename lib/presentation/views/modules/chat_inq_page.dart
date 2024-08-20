import 'package:flutter/material.dart';
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
        Widget cardChat() {
          return Container(
            width: layoutStyle.screenWidth,
            height: layoutStyle.blockVertical * 7,
            padding: EdgeInsets.symmetric(
              horizontal: layoutStyle.defaultMargin / 2,
              vertical: layoutStyle.defaultMargin / 5,
            ),
            decoration: BoxDecoration(
              color: colorStyle.white,
              border: Border(
                bottom: BorderSide(
                  color: colorStyle.lightGrey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: colorStyle.blue.withOpacity(0.30)),
                SizedBox(
                  width: layoutStyle.defaultMargin,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sya'),
                      Text('Hai Ganteng ....'),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          width: layoutStyle.screenWidth,
          height: layoutStyle.screenHeight,
          // padding: EdgeInsets.all(layoutStyle.defaultMargin),
          child: RefreshIndicator(
            onRefresh: () async {},
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                  cardChat(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
