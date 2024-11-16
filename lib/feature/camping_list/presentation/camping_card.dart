import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/component/link_text.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampingCard extends StatelessWidget {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? website;
  final String? compliantWithRelevantRegulations;
  final String? violationOfRelevantRegulations;
  final Function()? onCardTap;
  final Function(String? url)? onWebsiteTap;
  final Function()? onAddressTap;

  const CampingCard({
    super.key,
    this.name,
    this.address,
    this.phoneNumber,
    this.website,
    this.compliantWithRelevantRegulations,
    this.violationOfRelevantRegulations,
    this.onCardTap,
    this.onWebsiteTap,
    this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onCardTap,
        child: Container(
          decoration: BoxDecoration(
            color: subColor,
            //  violationOfRelevantRegulations?.isEmpty ?? true
            //     ? subColor
            //     : warningColor,
            borderRadius: BorderRadius.circular(cardRadius.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              normalPadding.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _Info(
                  title: 'camping_name'.locale(),
                  content: name,
                ),
                if (address?.isNotEmpty ?? false)
                  _Info(
                    title: 'camping_address'.locale(),
                    content: address,
                    canTap: true,
                    onTap: onAddressTap,
                  ),
                if (phoneNumber?.isNotEmpty ?? false)
                  _Info(
                    title: 'camping_phone_number'.locale(),
                    content: phoneNumber,
                  ),
                if (website?.isNotEmpty ?? false)
                  _Info(
                    title: 'camping_website'.locale(),
                    content: website,
                    canTap: true,
                    onTap: () {
                      onWebsiteTap?.call(website);
                    },
                  ),
                if (compliantWithRelevantRegulations?.isNotEmpty ?? false)
                  _Info(
                    title: 'compliant_relevant_regulations'.locale(),
                    content: compliantWithRelevantRegulations,
                  ),
                if (violationOfRelevantRegulations?.isNotEmpty ?? false)
                  _Info(
                    title: 'violation_relevant_regulations'.locale(),
                    content: violationOfRelevantRegulations,
                  ),
              ],
            ),
          ),
        ),
      );
}

class _Info extends StatelessWidget {
  final String? title;
  final String? content;
  final bool canTap;
  final Function()? onTap;

  const _Info({
    this.title,
    this.content,
    this.canTap = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: normalPadding.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title',
                style: TextStyle(
                  fontSize: normal.sp,
                  color: mainFontColor,
                )),
            Padding(
              padding: EdgeInsets.only(left: normalPadding.w),
              child: LinkText(
                content: content,
                onTap: canTap ? onTap : null,
              ),
            ),
          ],
        ),
      );
}
