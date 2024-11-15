import 'package:camping/core/domain/usecase/local_get_camping_site_use_case.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/camping_list/camping_card.dart';
import 'package:camping/feature/camping_list/camping_list_controller.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CampingListPage extends StatefulWidget {
  const CampingListPage({super.key});

  @override
  State<StatefulWidget> createState() => _CampingListPageState();
}

class _CampingListPageState extends State<CampingListPage> {
  CampingListController? controller;

  @override
  void initState() {
    super.initState();
    controller = CampingListController(
      getCampingSiteUseCase: LocalGetCampingSiteUseCase(),
    );
    controller?.fetchCampingSities();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        gestures: const [GestureType.onTap],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: mainColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              'camping_site_list'.locale(),
              style: TextStyle(
                color: mainFontColor,
                fontSize: title.sp,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.w),
                  child: TextField(
                    onChanged: controller?.onSearchTextChanged,
                    style: TextStyle(
                      fontSize: normal.sp,
                      color: mainFontColor,
                    ),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: normal.sp,
                        color: hintFontColor,
                      ),
                      hintText: 'search_camping_site_hint'.locale(),
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: controller?.searchCampingSities,
                    builder: (context, snapshot) => ListView.separated(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => Card(
                        child: CampingCard(
                          name: snapshot.data?[index]?.name,
                          address: snapshot.data?[index]?.address,
                          phoneNumber: snapshot.data?[index]?.telephone,
                          website: snapshot.data?[index]?.website,
                          compliantWithRelevantRegulations: snapshot
                              .data?[index]?.compliantWithRelevantRegulations,
                          violationOfRelevantRegulations: snapshot
                              .data?[index]?.violationOfRelevantRegulations,
                          onWebsiteTap: (url) {
                            controller?.launchWebSite(url);
                          },
                          onAddressTap: () {
                            controller?.launchMap(
                              name: snapshot.data?[index]?.name,
                              wgs: snapshot.data?[index]?.latitudeAndLongitude,
                            );
                          },
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
