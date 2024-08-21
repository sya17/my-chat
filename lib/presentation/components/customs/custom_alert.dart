import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tektok/app/utils/constant/lang.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';
import 'package:tektok/app/utils/translation/translation_constant.dart';
import 'package:tektok/presentation/components/customs/custom_button.dart';
import 'package:tektok/presentation/components/customs/custom_loading.dart';
import 'package:tektok/presentation/components/customs/custom_text_area.dart';

class CustomAlert {
  SnackbarController success(String title, String msg) {
    return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorStyle.green,
      colorText: colorStyle.white,
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.check_circle_rounded,
        color: colorStyle.white,
      ),
    );
  }

  SnackbarController error(String title, String msg) {
    return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorStyle.red,
      colorText: colorStyle.white,
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.dangerous,
        color: colorStyle.white,
      ),
    );
  }

  confirmation({
    required String title,
    required Function onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      titlePadding: EdgeInsets.only(top: layoutStyle.defaultMargin),
      radius: layoutStyle.defaultMargin / 2,
      contentPadding: EdgeInsets.only(
        top: layoutStyle.defaultMargin * 2,
        left: layoutStyle.defaultMargin,
        right: layoutStyle.defaultMargin,
      ),
      content: Row(
        children: [
          Expanded(
            child: CustomButton(
              margin: EdgeInsets.symmetric(
                horizontal: layoutStyle.defaultMargin / 2,
              ),
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => colorStyle.red,
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
              label: Text(
                'No',
                style: textStyle.whiteText,
              ),
              height: layoutStyle.blockVertical * 6.5,
            ),
          ),
          Expanded(
            child: CustomButton(
              margin: EdgeInsets.symmetric(
                horizontal: layoutStyle.defaultMargin / 2,
              ),
              onPressed: onConfirm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => colorStyle.green,
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
              label: Text(
                'Yes',
                style: textStyle.whiteText,
              ),
              height: layoutStyle.blockVertical * 6.5,
            ),
          ),
        ],
      ),
    );
  }

  changeLanguage() {
    return Get.defaultDialog(
      title: translate.chooseLanguage.tr,
      titlePadding: EdgeInsets.only(top: layoutStyle.defaultMargin),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.updateLocale(
                Locale(Lang.en_US.langCode, Lang.en_US.countryCode),
              );
              Get.back();
              alert.success("Success", "Language has been changed!");
            },
            child: Container(
              width: layoutStyle.blockHorizontal * 20,
              height: layoutStyle.blockHorizontal * 15,
              padding: EdgeInsets.all(layoutStyle.defaultMargin / 2),
              decoration: BoxDecoration(
                color: colorStyle.hawkes_blue,
                borderRadius:
                    BorderRadius.circular(layoutStyle.defaultMargin / 2),
                boxShadow: boxShadow.medium(
                  color: colorStyle.black.withOpacity(0.08),
                ),
              ),
              // child: Image.asset(
              //   assets.icUSFlag,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SizedBox(
            width: layoutStyle.defaultMargin,
          ),
          InkWell(
            onTap: () {
              Get.updateLocale(
                Locale(Lang.id_ID.langCode, Lang.id_ID.countryCode),
              );
              Get.back();
              alert.success("Success", "Language has been changed!");
            },
            child: Container(
              width: layoutStyle.blockHorizontal * 20,
              height: layoutStyle.blockHorizontal * 15,
              padding: EdgeInsets.all(layoutStyle.defaultMargin / 2),
              decoration: BoxDecoration(
                color: colorStyle.hawkes_blue,
                borderRadius:
                    BorderRadius.circular(layoutStyle.defaultMargin / 2),
                boxShadow: boxShadow.medium(
                  color: colorStyle.black.withOpacity(0.08),
                ),
              ),
              // child: Image.asset(
              //   assets.icIndonesianFlag,
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
    );
  }

  chooseFile({
    required Function()? onPressCamera,
    required Function()? onPressDocument,
  }) {
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(
          layoutStyle.defaultMargin,
        ),
        padding: EdgeInsets.all(
          layoutStyle.defaultMargin,
        ),
        height: layoutStyle.blockVertical * 18,
        decoration: BoxDecoration(
          color: colorStyle.white,
          borderRadius: BorderRadius.circular(
            layoutStyle.blockHorizontal * 5,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Choose your upload options',
              style: textStyle.blackText.copyWith(
                fontSize: 18,
                fontWeight: fontWeight.semiBold,
              ),
            ),
            SizedBox(
              height: layoutStyle.defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: onPressCamera,
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    size: layoutStyle.blockHorizontal * 10,
                    color: colorStyle.black,
                  ),
                  label: Text(
                    'Camera',
                    style: textStyle.blackText,
                  ),
                ),
                TextButton.icon(
                  onPressed: onPressDocument,
                  icon: Icon(
                    Icons.file_present_rounded,
                    size: layoutStyle.blockHorizontal * 10,
                    color: colorStyle.black,
                  ),
                  label: Text(
                    'Document',
                    style: textStyle.blackText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  selectCustomerService({
    required Function()? onPressWhatsapp,
    required Function()? onPressEmail,
  }) {
    Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(
          layoutStyle.defaultMargin,
        ),
        padding: EdgeInsets.all(
          layoutStyle.defaultMargin,
        ),
        height: layoutStyle.blockVertical * 18,
        decoration: BoxDecoration(
          color: colorStyle.white,
          borderRadius: BorderRadius.circular(
            layoutStyle.blockHorizontal * 5,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Choose Customer Service',
              style: textStyle.blackText.copyWith(
                fontSize: 18,
                fontWeight: fontWeight.semiBold,
              ),
            ),
            SizedBox(
              height: layoutStyle.defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: onPressWhatsapp,
                  icon: SizedBox(
                    width: layoutStyle.blockHorizontal * 10,
                    height: layoutStyle.blockHorizontal * 10,
                    // child: Image.asset(
                    //   assets.icWhatsappOutline,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  label: Text(
                    'Whatsapp',
                    style: textStyle.blackText,
                  ),
                ),
                TextButton.icon(
                  onPressed: onPressEmail,
                  icon: Icon(
                    Icons.email,
                    size: layoutStyle.blockHorizontal * 10,
                    color: colorStyle.black,
                  ),
                  label: Text(
                    'Email',
                    style: textStyle.blackText,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showNotes({
    required String label,
    required dynamic parent,
    required Function onConfirm,
  }) {
    Get.bottomSheet(
      isDismissible: false,
      Container(
        padding: EdgeInsets.all(
          layoutStyle.defaultMargin,
        ),
        height: layoutStyle.blockVertical * 42,
        decoration: BoxDecoration(
          color: colorStyle.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(layoutStyle.blockHorizontal * 5),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              label,
              style: textStyle.blackText.copyWith(
                fontSize: 18,
                fontWeight: fontWeight.semiBold,
              ),
            ),
            SizedBox(
              height: layoutStyle.defaultMargin,
            ),
            CustomTextArea(
              obscureText: false,
              border: Border.all(
                color: colorStyle.grey,
                width: 1,
              ),
              height: layoutStyle.blockVertical * 20,
              maxLines: 8,
              borderRadius: BorderRadius.circular(
                layoutStyle.defaultMargin / 2,
              ),
              onChanged: (val) {
                parent.setNotes(val);
              },
              decoration: InputDecoration(
                hintText: label,
                hintStyle: textStyle.greyText,
                border: InputBorder.none,
              ),
            ),
            SizedBox(
              height: layoutStyle.defaultMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomButton(
                    margin: EdgeInsets.symmetric(
                      vertical: layoutStyle.defaultMargin / 4,
                    ),
                    onPressed: onConfirm,
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
                    label: (parent.isLoading.value)
                        ? loading.buttonLoading()
                        : Text(
                            'Submit',
                            style: textStyle.whiteText,
                          ),
                    height: layoutStyle.blockVertical * 6.5,
                  ),
                ),
                SizedBox(
                  width: layoutStyle.defaultMargin,
                ),
                Expanded(
                  child: CustomButton(
                    margin: EdgeInsets.symmetric(
                      vertical: layoutStyle.defaultMargin / 4,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => colorStyle.red,
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
                    label: Text(
                      'Cancel',
                      style: textStyle.whiteText,
                    ),
                    height: layoutStyle.blockVertical * 6.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

CustomAlert alert = new CustomAlert();
