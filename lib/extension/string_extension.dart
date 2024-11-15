import 'package:camping/l10n/localizations.dart';

extension StringExtension on String {
  String locale() {
    return AppLocalizations().translate(this);
  }
}
