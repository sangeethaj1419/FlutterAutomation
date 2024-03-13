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
  // tests to check widget on right panel
  group('home page widget tests', () {
    testWidgets('Testing if like and home button displays', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text("Like"), findsOneWidget);
      expect(find.text("Next"), findsOneWidget);
    });
  });

// tests to check icons on navigation panel

  group('check icon on navigation panel', () {
    testWidgets('Testing is home and favorite icon displays', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.home), findsWidgets);
      expect(find.byIcon(Icons.favorite), findsWidgets);
    });
  });
}
