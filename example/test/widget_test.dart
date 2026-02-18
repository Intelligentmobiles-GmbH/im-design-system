import 'package:design_base_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Design Base Example app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const DesignBaseExampleApp());

    expect(find.text('Design Base'), findsOneWidget);
    expect(find.text('Premium Plan'), findsOneWidget);
  });
}
