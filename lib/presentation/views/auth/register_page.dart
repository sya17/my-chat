import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/controllers/auth/register_page_controller.dart';

class RegisterPage extends GetView<RegisterPageController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutStyle.init(context);

    return GetBuilder<RegisterPageController>(
      tag: 'loginPage',
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Scaffold();
      },
    );
  }
}
