import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/controllers/default/splash_page_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    layoutStyle.init(context);

    return GetBuilder<SplashPageController>(
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.all(layoutStyle.defaultMargin / 5),
              decoration: BoxDecoration(
                color: colorStyle.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: const CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
