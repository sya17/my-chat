import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/presentation/components/customs/custom_button.dart';
import 'package:tektok/presentation/components/customs/custom_text_box.dart';
import 'package:tektok/presentation/controllers/auth/login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    layoutStyle.init(context);

    return GetBuilder<LoginPageController>(
      tag: 'loginPage',
      init: controller,
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: colorStyle.white,
          appBar: AppBar(
            toolbarHeight: layoutStyle.blockVertical * 8,
            backgroundColor: colorStyle.white,
            elevation: 0,
          ),
          body: Container(
            width: layoutStyle.screenWidth,
            height: layoutStyle.screenHeight,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: layoutStyle.defaultMargin,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextBox(
                          height: layoutStyle.blockVertical * 6,
                          margin: EdgeInsets.symmetric(
                            vertical: layoutStyle.defaultMargin / 3,
                            // horizontal: layoutStyle.defaultMargin,
                          ),
                          obscureText: false,
                          border: Border.all(
                            color: colorStyle.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                            layoutStyle.defaultMargin / 2,
                          ),
                          controller: controller.noTelpController,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            prefix: SizedBox(
                              width: layoutStyle.defaultMargin / 2,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxWidth: layoutStyle.blockHorizontal * 6.5,
                              maxHeight: layoutStyle.blockHorizontal * 6.5,
                            ),
                            hintText: 'No Telp',
                            hintStyle: textStyle.greyText,
                            fillColor: colorStyle.white,
                            border: InputBorder.none,
                          ),
                          backgroundColor: colorStyle.white,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        width: layoutStyle.defaultMargin / 2,
                      ),
                      CustomButton(
                        width: layoutStyle.blockHorizontal * 20,
                        height: layoutStyle.blockVertical * 6,
                        margin: EdgeInsets.symmetric(
                          vertical: layoutStyle.defaultMargin / 2,
                          // horizontal: layoutStyle.defaultMargin,
                        ),
                        onPressed: () async {
                          controller.sendOtp();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => colorStyle.blue,
                          ),
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) => colorStyle.black.withOpacity(0.1),
                          ),
                          shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                layoutStyle.defaultMargin / 2,
                              ),
                            ),
                          ),
                        ),
                        label: const Icon(Icons.send_outlined),
                        // height: layoutStyle.blockVertical * 6.5,
                      ),
                    ],
                  ),
                ),
                CustomTextBox(
                  height: layoutStyle.blockVertical * 6,
                  margin: EdgeInsets.symmetric(
                    vertical: layoutStyle.defaultMargin / 3,
                    horizontal: layoutStyle.defaultMargin,
                  ),
                  obscureText: false,
                  border: Border.all(
                    color: colorStyle.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    layoutStyle.defaultMargin / 2,
                  ),
                  controller: controller.otpController,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    prefix: SizedBox(
                      width: layoutStyle.defaultMargin / 2,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: layoutStyle.blockHorizontal * 6.5,
                      maxHeight: layoutStyle.blockHorizontal * 6.5,
                    ),
                    hintText: 'OTP',
                    hintStyle: textStyle.greyText,
                    fillColor: colorStyle.white,
                    border: InputBorder.none,
                  ),
                  backgroundColor: colorStyle.white,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
