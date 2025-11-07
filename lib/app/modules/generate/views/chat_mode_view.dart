import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:watowear_chloe/app/modules/generate/controllers/chat_mode_controller.dart';

import '../../../../common/app_colors.dart';

class ChatModeView extends GetView<ChatModeController> {
  const ChatModeView({super.key});

  Color get _bubbleUser => const Color(0xFFF3EBDD); // beige pill
  Color get _textColor => const Color(0xFF3A3631);

  @override
  Widget build(BuildContext context) {
    // Ideally move this to a Binding, but OK for now:
    Get.put(ChatModeController());

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Column(
          spacing: 5.h,
          children: [
            Row(
              spacing: 6.w,
              children: [
                CircleAvatar(
                  radius: 23.r,
                  backgroundImage: const AssetImage(
                    'assets/images/onboarding/chloe_2.png',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WATOWEAR AI',
                      style: TextStyle(
                        color: AppColors.textIcons,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Your Style Assistant',
                      style: TextStyle(
                        color: AppColors.textIcons.withAlpha(153),
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black.withAlpha(87),
              thickness: 0.5.r,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 53.h),

            // 🔹 Messages list – scrollable area
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Obx(() {
                  final msgs = controller.messages;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                    msgs.length + (controller.isTyping.value ? 1 : 0),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index < msgs.length) {
                        final msg = msgs[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: _MessageBubble(message: msg),
                        );
                      } else {
                        // typing indicator
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 18),
                          child: _TypingIndicator(),
                        );
                      }
                    },
                  );
                }),
              ),
            ),

            // 🔹 Input bar – fixed at bottom
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: _buildInputBar(context),
            ),

            SizedBox(height: 100.h,),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFF4F1EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: controller.inputController,
              style: TextStyle(
                color: _textColor,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Ask Chloé',
                hintStyle: TextStyle(
                  color: AppColors.textIcons,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Comfortaa'
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: controller.sendMessage,
                      child: Icon(
                        Icons.mic_none_rounded,
                        size: 23.r,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onSubmitted: (_) => controller.sendMessage(),
            ),
          ),
        ),
        const SizedBox(width: 10),

      ],
    );
  }
}


class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  const _MessageBubble({required this.message});

  Color get _userBg => const Color(0xFFF4F1EB);
  Color get _textColor => AppColors.textIcons;

  @override
  Widget build(BuildContext context) {
    if (message.isUser) {
      // user message: centered beige pill
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.78,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 14,
              ),
              decoration: BoxDecoration(
                color: _userBg,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                message.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  color: _textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      // AI message: left aligned plain text
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage(
              'assets/images/onboarding/chloe_2.png', // same avatar

            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14.h,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Comfortaa',
                  ),
                ),

                Row(
                  spacing: 7.w,
                  children: [
                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/generate/upload.png',
                        scale: 4,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/generate/copy.png',
                        scale: 4,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/generate/like.png',
                        scale: 4,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {  },
                      child: Image.asset(
                        'assets/images/generate/dislike.png',
                        scale: 4,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    const dotSize = 6.0;
    return Row(
      children: [
        const CircleAvatar(
          radius: 14,
          backgroundImage: AssetImage(
            'assets/images/onboarding/chloe_2.png',
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _Dot(size: dotSize),
              const SizedBox(width: 4),
              _Dot(size: dotSize),
              const SizedBox(width: 4),
              _Dot(size: dotSize),
            ],
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final double size;
  const _Dot({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFB5A999),
        shape: BoxShape.circle,
      ),
    );
  }
}
