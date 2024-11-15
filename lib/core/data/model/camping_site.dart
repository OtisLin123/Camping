class CampingSite {
  ///露營場名稱
  String? name;

  ///縣市別
  String? county;

  ///鄉/鎮/市/區
  String? township;

  ///都市土地/非都市土地
  String? urbanLand;

  ///用地類別
  String? landUseCategory;

  ///營業狀態
  String? businessStatus;

  ///符合相關法規
  String? compliantWithRelevantRegulations;

  ///違反相關法規
  String? violationOfRelevantRegulations;

  ///原住民地區
  String? indigenousArea;

  ///公有合法
  String? publicLegal;

  ///國家公園
  String? nationalPark;

  ///國家風景區
  String? nationalScenicArea;

  ///國家森林遊樂區
  String? nationalForestRecreationArea;

  ///營業狀態類別
  String? businessStatusCategory;

  ///經緯度_WGS84
  String? latitudeAndLongitude;

  ///土地座落地號
  String? landParcelNumber;

  ///地址
  String? address;

  ///電話
  String? telephone;

  ///網站
  String? website;

  CampingSite({
    this.name,
    this.county,
    this.township,
    this.urbanLand,
    this.landUseCategory,
    this.businessStatus,
    this.compliantWithRelevantRegulations,
    this.violationOfRelevantRegulations,
    this.indigenousArea,
    this.publicLegal,
    this.nationalPark,
    this.nationalScenicArea,
    this.nationalForestRecreationArea,
    this.businessStatusCategory,
    this.latitudeAndLongitude,
    this.landParcelNumber,
    this.address,
    this.telephone,
    this.website,
  });
}
