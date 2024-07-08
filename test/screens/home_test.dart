import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:age_estimator/screens/home.dart';

void main() {
  group('Home Screen Tests', () {
    testWidgets('Home screen should have an AppBar with the correct title',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Home()));

      expect(find.byType(AppBar), findsOneWidget); 

      expect(find.widgetWithText(AppBar, 'Age Estimator ☕️'), findsOneWidget);
    });
  });
}
