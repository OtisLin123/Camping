import 'package:camping/style/color_style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkText extends StatelessWidget {
  final String? content;
  final Function()? onTap;

  const LinkText({
    super.key,
    this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Text(
          '$content',
          style: TextStyle(
            fontSize: normal.sp,
            color: onTap != null ? linkFontColor : mainFontColor,
            decoration: onTap != null ? TextDecoration.underline : null,
            decorationColor: linkFontColor,
          ),
        ),
      );
}
