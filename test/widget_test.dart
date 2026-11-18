import 'package:flutter_test/flutter_test.dart';
import 'package:ordonio_labact7/main.dart'; // Ensure this matches your project name

void main() {
  testWidgets('App starts with Login Screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentApp());

    // Verify that the Login screen is displayed initially
    expect(find.text('Login'), findsOneWidget);
  });
}