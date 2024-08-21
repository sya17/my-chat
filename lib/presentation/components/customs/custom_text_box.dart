import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';

class CustomTextBox extends StatefulWidget {
  final Text? label;
  final double height;
  final double width;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final bool obscureText;
  final TextStyle? style;
  final TextAlign textAlign;
  final BoxBorder? border;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry borderRadius;
  final Function(String)? onChanged;
  final int? maxLength;

  const CustomTextBox({
    Key? key,
    this.label,
    required this.height,
    this.width = double.infinity,
    this.backgroundColor,
    this.controller,
    this.margin = EdgeInsets.zero,
    this.padding,
    required this.obscureText,
    this.style,
    this.textAlign = TextAlign.left,
    this.border,
    required this.decoration,
    this.inputFormatters,
    this.keyboardType,
    this.boxShadow,
    this.borderRadius = BorderRadius.zero,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  State<CustomTextBox> createState() => _CustomTextBoxState();
}

class _CustomTextBoxState extends State<CustomTextBox> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.label != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: layoutStyle.defaultMargin / 2,
                  ),
                  child: widget.label,
                )
              : Container(),
          Container(
            height: widget.height,
            width: layoutStyle.screenWidth,
            padding: widget.padding ??
                EdgeInsets.symmetric(
                  horizontal: layoutStyle.defaultMargin / 2,
                ),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? colorStyle.white,
              borderRadius: widget.borderRadius,
              border: widget.border,
              boxShadow: widget.boxShadow,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller ?? _controller,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    inputFormatters: widget.inputFormatters,
                    textAlign: widget.textAlign,
                    maxLength: widget.maxLength,
                    style: widget.style ?? textStyle.blackText,
                    maxLines: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: widget.decoration.copyWith(
                      counterText: "",
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
