import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cell {
  final int ring;     // ring=0 => 4-piece hub, rings 1..ringCount => outer rings
  final int segment;  // hub: 0..3, outer: 0..segmentCount-1
  const Cell(this.ring, this.segment);

  @override
  bool operator ==(Object other) =>
      other is Cell && other.ring == ring && other.segment == segment;

  @override
  int get hashCode => Object.hash(ring, segment);
}

class ColorWheelController extends GetxController {
  // (kept for future use; not used for selection since we toggle on tap)
  final hue = 0.0.obs;
  final saturation = 1.0.obs;
  final value = 1.0.obs;

  final RxSet<Cell> selected = <Cell>{}.obs;

  Color get color =>
      HSVColor.fromAHSV(1, hue.value, saturation.value, value.value).toColor();

  void setFromPolar(Offset center, Offset point, double maxR) {
    final vec = point - center;
    final r = vec.distance.clamp(0, maxR);
    double angle = math.atan2(vec.dy, vec.dx);
    if (angle < 0) angle += 2 * math.pi;

    hue.value = angle * 180 / math.pi;
    saturation.value = (r / maxR).clamp(0.0, 1.0);
  }

  void toggleCell(int ring, int segment) {
    final c = Cell(ring, segment);
    if (selected.contains(c)) {
      selected.remove(c);
    } else {
      selected.add(c);
    }
  }

  /// Hub colors (ring=0), fixed order:
  /// 0 White, 1 Black, 2 9EA2AE, 3 DBB191
  static const List<Color> hubColors = [
    Color(0xFFFFFFFF),
    Color(0xFF000000),
    Color(0xFF9EA2AE),
    Color(0xFFDBB191),
  ];

  /// Returns the concrete Color for a given cell.
  Color cellToColor(Cell cell, int ringCount, int segmentCount) {
    if (cell.ring == 0) {
      final idx = cell.segment.clamp(0, 3);
      return hubColors[idx];
    }
    final h = (cell.segment * (360.0 / segmentCount)) % 360.0;
    final s = (cell.ring / ringCount).clamp(0.0, 1.0);
    return HSVColor.fromAHSV(1.0, h, s, 1.0).toColor();
  }

  /// Selected colors as a list (includes hub selections if any)
  List<Color> selectedColors(int ringCount, int segmentCount) {
    return selected
        .map((cell) => cellToColor(cell, ringCount, segmentCount))
        .toList(growable: false);
  }
}
