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
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: bodyMedinumGap.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: itemGap.w),
                child: LinkText(
                  content: '露營區資料來源為政府資料開放平臺，目前使用$govOpenDataSourceDate的版本',
                  onTap: () {
                    controller.launchGovOpenDataWeb();
                  },
                ),
              ),
              LinkText(
                content: '天氣資料來源為MeteoBlue',
                onTap: () {
                  controller.launchWeatherWeb();
                },
              )
            ],
          ),
        ),
      );
}
