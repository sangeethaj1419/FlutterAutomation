import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/main.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter_application_1',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );

void main() {
  group('home page widget tests', () {
    testWidgets('Testing if like and home button displays', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text("Like"), findsOneWidget);
      expect(find.text("Next"), findsOneWidget);
    });
  });

  group('Testing App', () {
    testWidgets("HomeIcon Test", (tester) async {
      await tester.pumpWidget(createHomeScreen());

      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text("Like"), findsOneWidget);
      expect(find.text("Next"), findsOneWidget);

      await tester.tap(find.text("Like"));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Next"));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Like"));

      await tester.tap(find.byIcon(Icons.favorite));
    });
  });
}
