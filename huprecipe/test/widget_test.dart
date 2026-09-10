import 'package:flutter_test/flutter_test.dart';
import 'package:huprecipe/app.dart';

void main() {
  testWidgets(
    'RecipeHub displays the home screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(const RecipeHubApp());

      await tester.pumpAndSettle();

      expect(find.text('Bonjour 👋'), findsOneWidget);
      expect(
        find.text('Découvrez de délicieuses recettes'),
        findsOneWidget,
      );
      expect(find.text('Recettes'), findsOneWidget);
    },
  );
}                                                                                                                                                                                 