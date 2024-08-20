import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tektok/app/main/app_route.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/components/custom_bottom_nav.dart';
import 'package:tektok/presentation/controllers/default/home_page_controller.dart';
import 'package:tektok/presentation/views/modules/chat_inq_page.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutStyle.init(context);

    return GetBuilder<HomePageController>(
      tag: 'homePage',
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: layoutStyle.blockVertical * 5,
            backgroundColor: colorStyle.white,
            foregroundColor: colorStyle.black,
            shadowColor: colorStyle.transparent,
            elevation: layoutStyle.defaultMargin,
            leadingWidth: layoutStyle.screenWidth,
            leading: Container(
              width: layoutStyle.screenWidth,
              height: layoutStyle.safeAreaVertical,
              color: colorStyle.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: layoutStyle.defaultMargin,
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
          ),
          bottomNavigationBar: const CustomBottomNav(),
          backgroundColor: colorStyle.lightGrey,
          // body: Container(
          //   child: Text(
          //     'Home Page',
          //     style: textStyle.blackText,
          //   ),
          // ),
          body: Navigator(
            key: controller.nestedKey,
            pages: AppRoute.contentPages,
            initialRoute: RouteName.chatInq,
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }
              // Perform any additional logic when a page is popped
              return true;
            },
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case RouteName.chatInq:
                  return MaterialPageRoute(
                    builder: (_) => const ChatInqPage(),
                  );
                case RouteName.newChat:
                  return MaterialPageRoute(
                    builder: (_) => Container(
                      child: Text('new chat'),
                    ),
                  );
                case RouteName.newContact:
                  return MaterialPageRoute(
                    builder: (_) => Container(
                      child: Text('new contact'),
                    ),
                  );
                case RouteName.newCommunity:
                  return MaterialPageRoute(
                    builder: (_) => Container(
                      child: Text('New Community'),
                    ),
                  );
                default:
                  return MaterialPageRoute(
                    builder: (_) => Container(
                      child: Text('default'),
                    ),
                  );
              }
            },
          ),
        );
      },
    );
  }
}
