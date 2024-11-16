import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/usecase/mock_get_camping_site_use_case.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/feature/camping_list/presentation/camping_card.dart';
import 'package:camping/feature/camping_list/presentation/camping_list_controller.dart';
import 'package:camping/feature/camping_list/presentation/camping_list_protocol.dart';
import 'package:camping/feature/component/app_bar_action_size.dart';
import 'package:camping/style/color_style.dart';
import 'package:camping/style/style.dart';
import 'package:camping/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CampingListPage extends StatefulWidget {
  const CampingListPage({super.key});

  @override
  State<StatefulWidget> createState() => _CampingListPageState();
}

class _CampingListPageState extends State<CampingListPage>
    implements CampingListProtocol {
  CampingListController? controller;

  @override
  void initState() {
    super.initState();
    controller = CampingListController(
      getCampingSiteUseCase: MockGetCampingSiteUseCase(),
      protocol: this,
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
            centerTitle: true,
            title: Text(
              'camping_site_list'.locale(),
              style: TextStyle(
                color: mainFontColor,
                fontSize: title.sp,
              ),
            ),
            actions: [
              ActionSize(
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/settingPage');
                  },
                  child: Icon(
                    Icons.settings,
                    size: barIconSize.w,
                    color: mainFontColor,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: bodyMedinumGap.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: itemGap.w),
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
                    stream: controller?.campingSiteCardDatas,
                    builder: (context, snapshot) => ListView.separated(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) => Card(
                        child: CampingCard(
                          name: snapshot.data?[index]?.name,
                          address: snapshot.data?[index]?.address,
                          phoneNumber: snapshot.data?[index]?.phoneNumber,
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
                          onCardTap: () {
                            controller?.onCardTap(
                              campingSiteUuid: snapshot.data?[index]?.uuid,
                            );
                          },
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: itemGap.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void goToCampingSite(CampingSite? data) {
    GoRouter.of(context).push('/campingSitePage', extra: data);
  }
}
