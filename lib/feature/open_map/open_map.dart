import 'package:url_launcher/url_launcher.dart';

Future<void> openMap({String? saddr, String? daddr}) async {
  final String googleMapsUrl = 'comgooglemaps://?q=$saddr,$daddr';
  final String appleMapsUrl = 'http://maps.apple.com/?q=$saddr,$daddr';

  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication);
  } else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
    await launchUrl(Uri.parse(appleMapsUrl),
        mode: LaunchMode.externalApplication);
  } else {
    throw Exception('Could not launch map');
  }
}

Future<void> openMapWith({String? name}) async {
  final String googleMapsUrl =
      'comgooglemaps://?q=${Uri.encodeComponent(name ?? '')}';
  final String appleMapsUrl =
      'http://maps.apple.com/?q=${Uri.encodeComponent(name ?? '')}';

  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(Uri.parse(googleMapsUrl),
        mode: LaunchMode.externalApplication);
  } else if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
    await launchUrl(Uri.parse(appleMapsUrl),
        mode: LaunchMode.externalApplication);
  } else {
    throw Exception('Could not launch map');
  }
}
