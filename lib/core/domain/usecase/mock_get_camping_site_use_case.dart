import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/usecase/get_camping_site_use_case.dart';
import 'package:camping/core/repositories/mock_repository.dart';
import 'package:uuid/uuid.dart';

class MockGetCampingSiteUseCase implements GetCampingSiteUseCase {
  @override
  Future<List<CampingSite>> getCampingSite() async {
    dynamic campings = await MockRepository().getCapmingSite();
    List<CampingSite> result = [];
    for (dynamic camping in campings) {
      if (camping['電話'] == '無') {
        camping['電話'] = '';
      }
      String? wgs = camping['經緯度_WGS84'];
      if (wgs?.contains('\n') ?? false) {
        wgs = wgs?.replaceAll('\n', ',');
      }
      result.add(CampingSite(
        uuid: const Uuid().v4(),
        name: camping['露營場名稱'],
        county: camping['縣市別'],
        township: camping['鄉/鎮/市/區'],
        urbanLand: camping['都市土地/非都市土地'],
        landUseCategory: camping['用地類別'],
        businessStatus: camping['營業狀態'],
        compliantWithRelevantRegulations: camping['符合相關法規'],
        violationOfRelevantRegulations: camping['違反相關法規'],
        indigenousArea: camping['原住民地區'],
        publicLegal: camping['公有合法'],
        nationalPark: camping['國家公園'],
        nationalScenicArea: camping['國家風景區'],
        nationalForestRecreationArea: camping['國家森林遊樂區'],
        businessStatusCategory: camping['營業狀態類別'],
        latitudeAndLongitude: wgs,
        landParcelNumber: camping['土地座落地號'],
        address: camping['地址'],
        telephone: camping['電話'],
        website: camping['網站'],
      ));
    }
    return result;
  }
}
