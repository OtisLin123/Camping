import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/component/bottom_navigation_bar/presentation/bottom_bar.dart';
import 'package:camping/feature/setting/presentation/setting_controller.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:rxdart/subjects.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingController? controller;
  BehaviorSubject<String?> versionSubject =
      BehaviorSubject<String?>.seeded(null);

  @override
  void initState() {
    super.initState();
    controller = SettingController();
    controller?.init();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        gestures: const [GestureType.onTap],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            centerTitle: true,
            title: Text(
              'settings'.locale(),
              style: TextStyle(
                color: mainFontColor,
                fontSize: title.sp,
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMedinumGap.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: itemGap.w),
                  child: SettingItem(
                    title: 'resource_declaration'.locale(),
                    onTap: () {
                      GoRouter.of(context).push('/resourceDeclarationPage');
                    },
                  ),
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                StreamBuilder(
                  stream: controller?.versionSubject,
                  builder: (context, data) => Text(
                    data.data ?? '',
                    style: TextStyle(
                      color: mainFontColor,
                      fontSize: normal.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    this.title,
    this.onTap,
  });

  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: big.sp,
                color: mainFontColor,
              ),
            ),
            if (onTap != null)
              SizedBox(
                width: indicatorSize.w,
                height: indicatorSize.w,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: mainFontColor,
                  size: indicatorSize.w,
                ),
              ),
          ],
        ),
      );
}

class SettingText extends StatelessWidget {
  const SettingText({
    super.key,
    this.title,
    this.onTap,
  });

  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: big.sp,
                color: mainFontColor,
              ),
            ),
          ],
        ),
      );
}
