import 'package:flutter/material.dart';

import 'package:tektok/app/utils/styles/theme_style.dart';

class CustomDetailItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final EdgeInsetsGeometry padding;

  const CustomDetailItem({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textStyle.greyText.copyWith(
              fontSize: fontSize.small,
            ),
          ),
          SizedBox(height: layoutStyle.defaultMargin / 3),
          Text(
            value,
            style: textStyle.blackText.copyWith(
              fontWeight: fontWeight.semiBold,
              color: valueColor ?? colorStyle.black,
            ),
          ),
        ],
      ),
    );
  }
}
