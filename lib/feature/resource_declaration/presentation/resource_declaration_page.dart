import 'package:camping/core/constants/constants.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/component/link_text.dart';
import 'package:camping/feature/resource_declaration/presentation/resource_declaration_controller.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResourceDeclarationPage extends StatefulWidget {
  const ResourceDeclarationPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ResourceDeclarationPageState();
}

class _ResourceDeclarationPageState extends State<ResourceDeclarationPage> {
  final ResourceDeclarationController controller =
      ResourceDeclarationController();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'resource_declaration'.locale(),
            style: TextStyle(
              color: mainFontColor,
              fontSize: title.sp,
            ),
          ),
          foregroundColor: mainFontColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMedinumGap.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: itemGap.w),
                child: LinkText(
                  content:
                      '${'camping_data_source_is'.locale()} $govOpenDataSourceDate',
                  onTap: () {
                    controller.launchGovOpenDataWeb();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: itemGap.w),
                child: LinkText(
                  content: '${'weather_data_source_is'.locale()} MeteoBlue',
                  onTap: () {
                    controller.launchWeatherWeb();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: itemGap.w),
                child: _Info(
                    title: 'stargazing_condition_calculation_formula'.locale(),
                    content: [
                      '${'night_sky_impact'.locale()} delta = ${'nightsky_brightness_actual'.locale()}-${'nightsky_brightness_clearsky'.locale()}',
                      '100,  if delta <= 0',
                      '((2 - delta) / 2) * 100, if 0 < delta < 2',
                      '0, if delta >= 2',
                      ('cloud_impact'.locale()),
                      'min(100, max(0,100-(${'totalcloudcover'.locale()}+${'fogProbability'.locale()})))',
                      ('moonlight_impact'.locale()),
                      'min(100, max(0,100-(${'moonlight_actual'.locale()}-${'moonlight_clearsky'.locale()})))',
                    ]),
              ),
            ],
          ),
        ),
      );
}

class _Info extends StatelessWidget {
  final String? title;
  final List<String?>? content;

  const _Info({
    this.title,
    this.content,
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
            Text(
              '$title',
              style: TextStyle(
                fontSize: normal.sp,
                color: mainFontColor,
              ),
            ),
            ...List.generate(
              content?.length ?? 0,
              (index) => Padding(
                padding: EdgeInsets.only(left: normalPadding.w),
                child: Text(
                  content?[index] ?? '',
                  style: TextStyle(
                    fontSize: normal.sp,
                    color: mainFontColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
