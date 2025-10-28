import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widget/color_wheel/color_wheel.dart';
import '../../../../common/widget/color_wheel/color_wheel_controller.dart';

class AboutYourself4View extends GetView {
  const AboutYourself4View({super.key});

  @override
  Widget build(BuildContext context) {
    // Two independent controllers: favorites & avoid
    final fav = Get.put(ColorWheelController(), tag: 'fav');
    final avoid = Get.put(ColorWheelController(), tag: 'avoid');

    const rings = 5;
    const segments = 18;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            Text(
              'Any Favorite Colors?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),

            24.verticalSpace,

            // ---------- Favorites ----------
            Text(
              'Colors I love',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            12.verticalSpace,

            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: ColorWheel(
                  controller: fav,
                  ringCount: rings,
                  segmentCount: segments,
                ),
              ),
            ),
            12.verticalSpace,

            // ---------- Avoid ----------
            Text(
              'Colors I avoid',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            12.verticalSpace,

            Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: ColorWheel(
                  controller: avoid,
                  ringCount: rings,
                  segmentCount: segments,
                ),
              ),
            ),
            12.verticalSpace,

            Row(
              children: [
                Text(
                  'Favorites:',
                  style: TextStyle(
                    color: const Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.57.sp,
                  ),
                ),
              ],
            ),
            8.verticalSpace,

            Obx(() {
              final colors = fav.selectedColors(rings, segments);
              if (colors.isEmpty) {
                return Text(
                  'Tap colors above to add your favorites.',
                  style: TextStyle(color: const Color(0xFF6B7280), fontSize: 13.sp),
                );
              }
              return Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: colors.map((c) {
                  return _ColorChip(
                    color: c,
                    onTap: () {
                      // Find the matching cell and toggle off
                      final cell = fav.selected.firstWhere(
                            (cell) => fav.cellToColor(cell, rings, segments).value == c.value,
                      );
                      fav.toggleCell(cell.ring, cell.segment);
                    },
                  );
                }).toList(),
              );
            }),
            28.verticalSpace,

            Row(
              children: [
                Text(
                  'Avoid:',
                  style: TextStyle(
                    color: const Color(0xFF4B5563),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.57.sp,
                  ),
                ),
              ],
            ),
            8.verticalSpace,

            Obx(() {
              final colors = avoid.selectedColors(rings, segments);
              if (colors.isEmpty) {
                return Text(
                  'Tap colors above to add avoided colors.',
                  style: TextStyle(color: const Color(0xFF6B7280), fontSize: 13.sp),
                );
              }
              return Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: colors.map((c) {
                  return _ColorChip(
                    color: c,
                    onTap: () {
                      final cell = avoid.selected.firstWhere(
                            (cell) => avoid.cellToColor(cell, rings, segments).value == c.value,
                      );
                      avoid.toggleCell(cell.ring, cell.segment);
                    },
                  );
                }).toList(),
              );
            }),

            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}

/// Simple circular color chip that removes on tap
class _ColorChip extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  const _ColorChip({required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.r,
        height: 44.r,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black26, width: 2),
          boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.black12, offset: Offset(0, 1))],
        ),
      ),
    );
  }
}
