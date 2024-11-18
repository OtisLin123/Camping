import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: indicatorSize.w,
          height: indicatorSize.w,
          child: const CircularProgressIndicator(
            color: mainFontColor,
          ),
        ),
      );
}
