import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tektok/app/utils/styles/theme_style.dart';

class CustomLookupInput extends StatefulWidget {
  final Text? label;
  final double height;
  final double width;
  final TextEditingController? controller;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final TextAlign textAlign;
  final BoxBorder? border;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry borderRadius;
  final Function()? onTap;
  final Function()? onClear;
  final Function(String?)? onSubmitted;
  final bool enable;

  const CustomLookupInput({
    Key? key,
    this.label,
    required this.height,
    this.width = double.infinity,
    this.controller,
    this.margin = EdgeInsets.zero,
    this.padding,
    this.style,
    this.textAlign = TextAlign.left,
    this.border,
    required this.decoration,
    this.inputFormatters,
    this.keyboardType,
    this.boxShadow,
    this.borderRadius = BorderRadius.zero,
    this.onTap,
    this.onClear,
    this.onSubmitted,
    this.enable = false,
  }) : super(key: key);

  @override
  State<CustomLookupInput> createState() => _CustomLookupInputState();
}

class _CustomLookupInputState extends State<CustomLookupInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: layoutStyle.defaultMargin / 2,
                  ),
                  child: widget.label,
                )
              : Container(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: widget.height,
                  width: layoutStyle.screenWidth,
                  padding: widget.padding ??
                      EdgeInsets.symmetric(
                        horizontal: layoutStyle.defaultMargin / 2,
                      ),
                  decoration: BoxDecoration(
                    color: colorStyle.white,
                    borderRadius: widget.borderRadius,
                    border: widget.border,
                    boxShadow: widget.boxShadow,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: widget.controller ?? _controller,
                          keyboardType: widget.keyboardType,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: widget.inputFormatters,
                          textAlign: widget.textAlign,
                          onSubmitted: widget.onSubmitted,
                          style: widget.style ?? textStyle.blackText,
                          decoration: widget.decoration.copyWith(
                            enabled: widget.enable,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: widget.onTap,
                        child: SizedBox(
                          width: layoutStyle.blockHorizontal * 6.5,
                          height: layoutStyle.blockHorizontal * 6.5,
                          // child: Image.asset(
                          //   assets.icSearch,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.onClear != null)
                InkWell(
                  onTap: widget.onClear,
                  child: SizedBox(
                    width: layoutStyle.blockHorizontal * 6.5,
                    height: layoutStyle.blockHorizontal * 6.5,
                    child: Icon(
                      Icons.refresh,
                      color: colorStyle.black,
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
