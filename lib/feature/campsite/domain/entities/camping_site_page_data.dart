class CampingSitePageData {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? website;
  final String? compliantWithRelevantRegulations;
  final String? violationOfRelevantRegulations;

  const CampingSitePageData({
    this.name,
    this.address,
    this.phoneNumber,
    this.website,
    this.compliantWithRelevantRegulations,
    this.violationOfRelevantRegulations,
  });

  bool get addressVisible => address?.isNotEmpty ?? false;
  bool get phoneNumberVisible => phoneNumber?.isNotEmpty ?? false;
  bool get websiteVisible => website?.isNotEmpty ?? false;
  bool get compliantRegulationsVisible =>
      compliantWithRelevantRegulations?.isNotEmpty ?? false;
  bool get violationRegulationsVisible =>
      violationOfRelevantRegulations?.isNotEmpty ?? false;
}
