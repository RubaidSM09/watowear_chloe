import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';

class OtpField extends GetView<OtpController> {
  final double boxWidth;
  final double underlineThickness;
  final double spacing;

  const OtpField({
    super.key,
    this.boxWidth = 46,
    this.underlineThickness = 2,
    this.spacing = 17,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(controller.otpLength, (i) {
        final isFirst = i == 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.w / 2),
          child: SizedBox(
            width: boxWidth.w,
            child: Focus(
              onKeyEvent: (node, evt) =>
                  controller.handleBackspaceOnEmpty(i, evt),
              child: TextField(
                focusNode: controller.focusNodes[i],
                controller: controller.controllers[i],
                autofocus: i == 0,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
                cursorWidth: 1.6.w,
                decoration: InputDecoration(
                  counterText: '',
                  isDense: true,
                  contentPadding: const EdgeInsets.only(bottom: 8),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withAlpha(89),
                      width: underlineThickness,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withAlpha(89),
                      width: underlineThickness,
                    ),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                      isFirst ? controller.otpLength : 1),
                ],
                onChanged: (val) => controller.handleChange(i, val),
                onTap: () {
                  final c = controller.controllers[i];
                  c.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: c.text.length,
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
