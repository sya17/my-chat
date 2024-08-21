import 'package:flutter/material.dart';

import 'package:tektok/app/utils/styles/theme_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget? icon;
  final String? title;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool centeredTitle;

  const CustomAppBar({
    Key? key,
    required this.leading,
    this.icon,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.centeredTitle = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? colorStyle.dark_blue,
      elevation: 0,
      leading: leading,
      centerTitle: centeredTitle,
      title: Tooltip(
        message: title ?? '',
        triggerMode: TooltipTriggerMode.tap,
        child: Text(
          title ?? '',
          style: textStyle.whiteText.copyWith(
            fontSize: fontSize.title,
            fontWeight: fontWeight.semiBold,
            color: titleColor ?? colorStyle.white,
          ),
        ),
      ),
      actions: icon != null
          ? [
              icon!,
              SizedBox(
                width: layoutStyle.defaultMargin / 1.5,
              ),
            ]
          : [],
    );
  }
}
