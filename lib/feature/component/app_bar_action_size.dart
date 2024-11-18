import 'package:camping/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionSize extends StatelessWidget {
  const ActionSize({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: barButtonSize.w,
        height: barButtonSize.w,
        child: child,
      );
}
