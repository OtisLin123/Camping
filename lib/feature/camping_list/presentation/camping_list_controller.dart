import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/usecase/get_camping_site_use_case.dart';
import 'package:camping/feature/camping_list/domain/entities/camping_card_data.dart';
import 'package:camping/feature/camping_list/domain/usecase/convert_camping_card_datas_use_case.dart';
import 'package:camping/feature/camping_list/presentation/camping_list_protocol.dart';
import 'package:camping/feature/open_map/open_map.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:rxdart/subjects.dart';
import 'package:url_launcher/url_launcher.dart';

class CampingListController {
  GetCampingSiteUseCase? getCampingSiteUseCase;

  CampingListProtocol? protocol;

  BehaviorSubject<List<CampingSite?>?> campingSities =
      BehaviorSubject<List<CampingSite?>?>.seeded(null);

  BehaviorSubject<List<CampingCardData?>?> campingSiteCardDatas =
      BehaviorSubject<List<CampingCardData?>?>.seeded(null);

  CampingListController({
    this.getCampingSiteUseCase,
    this.protocol,
  });

  void fetchCampingSities() {
    getCampingSiteUseCase?.getCampingSite().then((values) {
      campingSities.add(values);
      doFuzzy('');
    });
  }

  void launchWebSite(String? url) {
    if (url == null) return;
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  void launchMap({
    String? wgs,
    String? name,
  }) {
    if (wgs?.isEmpty ?? true) {
      openMapWith(name: name);
      return;
    }
    List<String?>? latitudeAndLongitude = wgs?.split(',');
    String? latitude = latitudeAndLongitude?.first ?? '';
    String? longitude = latitudeAndLongitude?.last ?? '';
    openMap(latitude: latitude.trim(), longitude: longitude.trim());
  }

  void onCardTap({String? campingSiteUuid}) {
    if (campingSiteUuid == null) {
      return;
    }
    CampingSite? data;
    campingSities.value?.forEach((e) {
      if (e?.uuid == campingSiteUuid) {
        data = e;
      }
    });
    protocol?.goToCampingSite(data);
  }

  void onSearchTextChanged(String text) {
    doFuzzy(text);
  }

  void doFuzzy(String? text) {
    if (text?.isEmpty != false) {
      campingSiteCardDatas.add(
        ConvertCampingCardDatasUseCase().convertToCardDatas(
          datas: campingSities.value,
        ),
      );
      return;
    }

    final fuse = Fuzzy<CampingSite?>(
      campingSities.value,
      options: FuzzyOptions(
        keys: [
          WeightedKey(
            name: 'name',
            getter: (item) => item?.name ?? '',
            weight: 1.0,
          ),
          WeightedKey(
            name: 'address',
            getter: (item) => item?.address ?? '',
            weight: 1,
          ),
        ],
      ),
    );
    final results = fuse.search(text ?? '');

    campingSiteCardDatas.add(
      List.generate(
        results.length,
        (index) => ConvertCampingCardDatasUseCase().convertToCardData(
          data: results[index].item,
        ),
      ),
    );
  }
}
