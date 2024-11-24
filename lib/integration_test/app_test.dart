import 'package:camping/core/data/model/camping_site.dart';
import 'package:camping/core/domain/usecase/imp_get_camping_site_use_case.dart';
import 'package:camping/core/repositories/mock_repository.dart';
import 'package:camping/extension/string_extension.dart';
import 'package:camping/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      'tap on the first Camping Site Card',
      (tester) async {
        await tester.pumpWidget(MyApp(
          repository: MockRepository(),
        ));

        await tester.pumpAndSettle();

        List<CampingSite> campingSite = await ImpGetCampingSiteUseCase(
          repository: MockRepository(),
        ).getCampingSite();

        final campingSiteList = find.byKey(const ValueKey('camping_site_list'));
        for (int i = 0; i < campingSite.length; i++) {
          final card = find.byKey(ValueKey('camping_site_card_$i'));
          await tester.scrollUntilVisible(
            card,
            10.0,
            scrollable: find.descendant(
              of: campingSiteList,
              matching: find.byType(Scrollable),
            ),
          );
          await tester.pumpAndSettle();

          await tester.tap(find.descendant(
            of: card,
            matching: find.byType(Text).at(1),
          ));

          await tester.pumpAndSettle();

          find.ancestor(
            of: find.byType(AppBar),
            matching: find.text(campingSite[i].name ?? ''),
          );

          if (campingSite[i].address?.isEmpty ?? true) {
            expect(
              find.text('camping_address'.locale()),
              findsNothing,
              reason:
                  'Failed for camping address title should be not found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].address!),
              findsNothing,
              reason:
                  'Failed for camping address should be not found with : ${campingSite[i].name}',
            );
          } else {
            expect(
              find.text('camping_address'.locale()),
              findsOneWidget,
              reason:
                  'Failed for camping address title should be found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].address!),
              findsOneWidget,
              reason:
                  'Failed for camping address should be found with : ${campingSite[i].name}',
            );
          }

          if (campingSite[i].telephone?.isEmpty ?? true) {
            expect(
              find.text('camping_phone_number'.locale()),
              findsNothing,
              reason:
                  'Failed for camping phone number title should be not found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].telephone!),
              findsNothing,
              reason:
                  'Failed for camping phone number should be not found with ${campingSite[i].name}',
            );
          } else {
            expect(
              find.text('camping_phone_number'.locale()),
              findsOneWidget,
              reason:
                  'Failed for camping phone number title should be found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].telephone!),
              findsOneWidget,
              reason:
                  'Failed for camping phone number should be found with ${campingSite[i].name}',
            );
          }

          if (campingSite[i].website?.isEmpty ?? true) {
            expect(
              find.text('camping_website'.locale()),
              findsNothing,
              reason:
                  'Failed for camping website title should be not found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].website!),
              findsNothing,
              reason:
                  'Failed for camping website should be not found with ${campingSite[i].name}',
            );
          } else {
            expect(
              find.text('camping_website'.locale()),
              findsOneWidget,
              reason:
                  'Failed for camping website title should be found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].website!),
              findsOneWidget,
              reason:
                  'Failed for camping website should be found with ${campingSite[i].name}',
            );
          }

          if (campingSite[i].compliantWithRelevantRegulations?.isEmpty ??
              true) {
            expect(
              find.text('compliant_relevant_regulations'.locale()),
              findsNothing,
              reason:
                  'Failed for compliant relevant title should be not found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].compliantWithRelevantRegulations!),
              findsNothing,
              reason:
                  'Failed for compliant relevant should be not found with ${campingSite[i].name}',
            );
          } else {
            expect(
              find.text('compliant_relevant_regulations'.locale()),
              findsOneWidget,
              reason:
                  'Failed for compliant relevant title should be found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].compliantWithRelevantRegulations!),
              findsOneWidget,
              reason:
                  'Failed for compliant relevant should be found with ${campingSite[i].name}',
            );
          }

          if (campingSite[i].violationOfRelevantRegulations?.isEmpty ?? true) {
            expect(
              find.text('violation_relevant_regulations'.locale()),
              findsNothing,
              reason:
                  'Failed for violation relevant title should be not found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].violationOfRelevantRegulations!),
              findsNothing,
              reason:
                  'Failed for violation relevant should be not found with ${campingSite[i].name}',
            );
          } else {
            expect(
              find.text('violation_relevant_regulations'.locale()),
              findsOneWidget,
              reason:
                  'Failed for violation relevant title should be found with ${campingSite[i].name}',
            );
            expect(
              find.text(campingSite[i].violationOfRelevantRegulations!),
              findsOneWidget,
              reason:
                  'Failed for violation relevant should be found with ${campingSite[i].name}',
            );
          }

          await tester.pumpAndSettle();

          if (campingSite[i].latitudeAndLongitude?.isNotEmpty ?? false) {
            final weatherList = find.byKey(const ValueKey('weather_list'));
            for (int i = 0; i < 7; i++) {
              final targetItem = find.byKey(ValueKey('weather_card_$i'));
              await tester.scrollUntilVisible(
                targetItem,
                200.0,
                scrollable: find.descendant(
                  of: weatherList,
                  matching: find.byType(Scrollable),
                ),
              );
              await tester.pumpAndSettle();
              expect(
                targetItem,
                findsOneWidget,
                reason:
                    'Failed for weather card index:$i should be found with ${campingSite[i].name}',
              );
            }
          } else {
            expect(
              find.text('weather_forecast_warning'.locale()),
              findsOneWidget,
              reason:
                  'Failed for weather forecast warning should be found with ${campingSite[i].name}',
            );
          }

          await tester.tap(
            find.byType(BackButton),
          );
          await tester.pumpAndSettle();
        }
      },
    );
  });
}
