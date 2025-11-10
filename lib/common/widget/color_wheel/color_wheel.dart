import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'color_wheel_controller.dart';

class ColorWheel extends StatelessWidget {
  final ColorWheelController controller;
  final int ringCount;
  final int segmentCount;

  static const double hubFraction = 0.18;

  const ColorWheel({
    super.key,
    required this.controller,
    this.ringCount = 5,
    this.segmentCount = 18,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = math.min(constraints.maxWidth, constraints.maxHeight);

      return _WheelGestureLayer(
        onTapToggle: (center, pos, maxR) {
          final v = pos - center;
          final R = maxR;
          final r = v.distance;

          final double hubR = R * hubFraction;

          // Inside 4-piece hub (ring=0, seg=0..3)
          if (r <= hubR) {
            double ang = math.atan2(v.dy, v.dx);
            if (ang < 0) ang += 2 * math.pi;
            final double quadSweep = math.pi / 2;
            int hubSeg = (ang / quadSweep).floor() % 4;
            controller.toggleCell(0, hubSeg);
            return;
          }

          // Outer rings
          if (r <= 0 || r > R) return;

          final ringThickness = R / ringCount;
          int ring = (r / ringThickness).ceil();
          ring = ring.clamp(1, ringCount);

          double ang = math.atan2(v.dy, v.dx);
          if (ang < 0) ang += 2 * math.pi;
          final segSweep = 2 * math.pi / segmentCount;
          int seg = (ang / segSweep).floor();
          seg = seg.clamp(0, segmentCount - 1);

          controller.toggleCell(ring, seg);
        },
        child: Obx(() {
          final selectedSnapshot = Set<Cell>.from(controller.selected);
          return CustomPaint(
            painter: _DiscreteWheelPainter(
              ringCount: ringCount,
              segmentCount: segmentCount,
              selected: selectedSnapshot,
              hubFraction: hubFraction,
              radiusFactor: 0.85, // you set this to reduce radius slightly
            ),
          );
        }),
      );
    });
  }
}

class _WheelGestureLayer extends StatelessWidget {
  final Widget child;
  final void Function(Offset center, Offset position, double maxR) onTapToggle;

  const _WheelGestureLayer({
    required this.child,
    required this.onTapToggle,
  });

  @override
  Widget build(BuildContext context) {
    Offset? _center;
    double? _maxR;

    void _toggle(Offset localPos) {
      if (_center == null || _maxR == null) return;
      onTapToggle(_center!, localPos, _maxR!);
    }

    return LayoutBuilder(builder: (context, constraints) {
      final size = math.min(constraints.maxWidth, constraints.maxHeight);
      _center = Offset(size / 2, size / 2);
      _maxR = size / 2;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (d) => _toggle(d.localPosition),
        child: child,
      );
    });
  }
}

class _DiscreteWheelPainter extends CustomPainter {
  final int ringCount;
  final int segmentCount;
  final Set<Cell> selected;
  final double hubFraction;
  final double radiusFactor;

  _DiscreteWheelPainter({
    required this.ringCount,
    required this.segmentCount,
    required this.selected,
    required this.hubFraction,
    this.radiusFactor = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final R = size.shortestSide / 2 * radiusFactor;

    final double ringThickness = R / ringCount;
    final double segSweep = 2 * math.pi / segmentCount;

    // Outer discrete tiles
    for (int r = 1; r <= ringCount; r++) {
      final double outerR = ringThickness * r;
      final double innerR = outerR - ringThickness;

      final Rect outerRect = Rect.fromCircle(center: center, radius: outerR);
      final Rect innerRect = Rect.fromCircle(center: center, radius: innerR);

      final double s = (r / ringCount).clamp(0.0, 1.0);

      for (int seg = 0; seg < segmentCount; seg++) {
        final double start = seg * segSweep;
        final double end = start + segSweep;
        final double h = (seg * (360.0 / segmentCount)) % 360.0;

        final Path tile = Path()
          ..arcTo(outerRect, start, segSweep, false)
          ..lineTo(
            center.dx + innerR * math.cos(end),
            center.dy + innerR * math.sin(end),
          )
          ..arcTo(innerRect, end, -segSweep, false)
          ..close();

        final Paint fill = Paint()
          ..style = PaintingStyle.fill
          ..color = HSVColor.fromAHSV(1.0, h, s, 1.0).toColor();
        canvas.drawPath(tile, fill);

        final bool isSelected = selected.contains(Cell(r, seg));
        final Paint border = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = isSelected ? 4.0 : 1.0
          ..color = isSelected
              ? Colors.white
              : Colors.white.withOpacity(0.6);
        canvas.drawPath(tile, border);

        if (isSelected) {
          final Paint glow = Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 8
            ..color = Colors.black12
            ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 6);
          canvas.drawPath(tile, glow);
        }
      }
    }

    // 4-segment center hub (ring=0, seg 0..3)
    final double hubR = R * hubFraction;
    final Rect hubRect = Rect.fromCircle(center: center, radius: hubR);

    const hubColors = [
      Color(0xFFFFFFFF),
      Color(0xFF000000),
      Color(0xFF9EA2AE),
      Color(0xFFDBB191),
    ];

    for (int i = 0; i < 4; i++) {
      final double start = i * (math.pi / 2);

      final Path p = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(hubRect, start, math.pi / 2, false)
        ..close();

      canvas.drawPath(p, Paint()..color = hubColors[i]);

      final bool isSelectedHub = selected.contains(Cell(0, i));
      final Paint border = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelectedHub ? 4.0 : 1.0
        ..color = isSelectedHub
            ? Colors.black.withOpacity(0.7)
            : Colors.white.withOpacity(0.9);
      canvas.drawPath(p, border);

      if (isSelectedHub) {
        final Paint glow = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8
          ..color = Colors.black12
          ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 6);
        canvas.drawPath(p, glow);
      }
    }

    // Thin ring around hub
    canvas.drawCircle(
      center,
      hubR,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Colors.white.withOpacity(0.9),
    );
  }

  @override
  bool shouldRepaint(covariant _DiscreteWheelPainter old) {
    if (old.ringCount != ringCount || old.segmentCount != segmentCount) return true;
    if (old.hubFraction != hubFraction) return true;
    if (old.selected.length != selected.length) return true;
    if (!old.selected.containsAll(selected) || !selected.containsAll(old.selected)) return true;
    if (old.radiusFactor != radiusFactor) return true;
    return false;
  }
}
