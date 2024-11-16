import 'package:camping/extension/datetime_extension.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/campsite/domain/entities/day_weather_data.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayWeather extends StatelessWidget {
  final DayWeatherData? data;

  const DayWeather({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            cardRadius.w,
          ),
          color: subColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(normalPadding.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _Info(
                title: 'date'.locale(),
                content: data?.dateTime?.todayOrMD(),
              ),
              _Info(
                title: 'temperature_max'.locale(),
                content: data?.temperatureMax.toString() ?? '',
              ),
              _Info(
                title: 'temperature_min'.locale(),
                content: data?.temperatureMin.toString() ?? '',
              ),
              _Info(
                title: 'pricipitation_probability'.locale(),
                content: data?.precipitationProbability.toString() ?? '',
              ),
            ],
          ),
        ),
      );
}

class _Info extends StatelessWidget {
  final String? title;
  final String? content;

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
            Padding(
              padding: EdgeInsets.only(left: normalPadding.w),
              child: Text(
                '$content',
                style: TextStyle(
                  fontSize: normal.sp,
                  color: mainFontColor,
                ),
              ),
            ),
          ],
        ),
      );
}
