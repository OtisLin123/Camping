import 'package:camping/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    this.children,
    this.backgroundColor,
  });

  final List<Widget>? children;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: footerHeight.w,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: barPadding.w,
              right: barPadding.w,
              bottom: barPadding.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: children ?? [],
            ),
          ),
        ),
      );
}
