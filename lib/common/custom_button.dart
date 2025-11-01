import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final String? icon;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? textColor;
  final BoxBorder? border;
  final double? textSize;

  const CustomButton({
    required this.onTap,
    this.text,
    this.icon,
    this.padding,
    this.color,
    this.textColor,
    this.border,
    this.textSize,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          border: border,
        ),
        child: text != null ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 9.w,
          children: [
            if (icon != null)
              Image.asset(
                icon!,
                scale: 4,
              ),

            Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.w600,
                fontFamily: 'Comfortaa',
              ),
            ),
          ],
        ) : icon != null ? Image.asset(
          icon!,
          scale: 4,
        ) : null,
      ),
    );
  }
}
