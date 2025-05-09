import 'package:flutter/material.dart';

class DashedDivider extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color color;

  const DashedDivider({
    super.key,
    this.dashWidth = 5,
    this.dashHeight = 1,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashSpacing = dashWidth; // You can customize spacing here
        final dashCount = (constraints.maxWidth / (dashWidth + dashSpacing)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            dashCount,
            (_) => SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
