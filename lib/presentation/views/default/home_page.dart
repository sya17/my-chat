import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/components/custom_bottom_nav.dart';
import 'package:tektok/presentation/controllers/default/home_page_controller.dart';

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
          body: Container(
            child: Text(
              'Home Page',
              style: textStyle.blackText,
            ),
          ),
        );
      },
    );
  }
}
