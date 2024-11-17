import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/usecase/imp_forecast_data_imp_use_case.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/campsite/domain/entities/day_weather_data.dart';
import 'package:camping/feature/campsite/presentation/camping_site_controller.dart';
import 'package:camping/feature/campsite/presentation/day_weather.dart';
import 'package:camping/feature/component/link_text.dart';
import 'package:camping/feature/component/loading_indicator.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CampingSitePage extends StatefulWidget {
  const CampingSitePage({super.key, this.data});

  final CampingSite? data;

  @override
  State<StatefulWidget> createState() => _CampingSitePageState();
}

class _CampingSitePageState extends State<CampingSitePage> {
  CampingSiteController? controller;

  @override
  void initState() {
    super.initState();
    controller = CampingSiteController(
      sourceData: widget.data,
      forecastDataUseCase: ImpForecastDataUseCase(),
    );
    controller?.init();
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
            title: StreamBuilder(
              stream: controller?.campingSitePageData,
              builder: (context, snapshot) => Text(
                snapshot.data?.name ?? '',
                style: TextStyle(
                  color: mainFontColor,
                  fontSize: title.sp,
                ),
              ),
            ),
            foregroundColor: mainFontColor,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMedinumGap.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: controller?.campingSitePageData,
                  builder: (context, snapshot) => _BaseInfo(
                    name: snapshot.data?.name,
                    address: snapshot.data?.address,
                    phoneNumber: snapshot.data?.phoneNumber,
                    website: snapshot.data?.website,
                    compliantWithRelevantRegulations:
                        snapshot.data?.compliantWithRelevantRegulations,
                    violationOfRelevantRegulations:
                        snapshot.data?.violationOfRelevantRegulations,
                    onWebsiteTap: controller?.launchWebSite,
                    onAddressTap: controller?.launchMap,
                  ),
                ),
                StreamBuilder(
                  stream: controller?.dayWeahters,
                  builder: (context, snapshot) => _WeatherInfo(
                    datas: snapshot.data,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _BaseInfo extends StatelessWidget {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? website;
  final String? compliantWithRelevantRegulations;
  final String? violationOfRelevantRegulations;
  final Function()? onWebsiteTap;
  final Function()? onAddressTap;

  const _BaseInfo({
    this.name,
    this.address,
    this.phoneNumber,
    this.website,
    this.compliantWithRelevantRegulations,
    this.violationOfRelevantRegulations,
    this.onWebsiteTap,
    this.onAddressTap,
  });
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              onTap: onWebsiteTap,
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
      );
}

class _WeatherInfo extends StatelessWidget {
  final List<DayWeatherData?>? datas;
  const _WeatherInfo({this.datas});

  @override
  Widget build(BuildContext context) {
    if (datas == null) {
      return const Expanded(
        child: Center(
          child: LoadingIndicator(),
        ),
      );
    }

    if (datas!.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'weather_forecast_warning'.locale(),
            style: TextStyle(
              fontSize: normal.sp,
              color: mainFontColor,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Card(
          child: DayWeather(
            data: datas?[index],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 4.w,
        ),
        itemCount: datas?.length ?? 0,
      ),
    );
  }
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
