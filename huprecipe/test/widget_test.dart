import 'package:flutter_test/flutter_test.dart';

import 'package:huprecipe/app.dart';

void main() {
  testWidgets('RecipeHub app starts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipeHubApp());

    expect(find.text('Bonjour 👋'), findsOneWidget);
  });
}