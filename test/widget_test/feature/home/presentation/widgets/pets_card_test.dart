import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/pets_card.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';

void main() {
  final fakePet = BreedModel(
    id: '1',
    name: 'Persian Cat',
    temperament: 'Calm, Gentle',
    origin: 'Egypt',
    referenceImageId: 'abc123',
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('should display pet name, temperament, and origin',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: PetsCard(pet: fakePet),
            ),
          ),
        ),
      );

      await tester.pump(); 

      // ✅ Verify texts are displayed correctly
      expect(find.text('Persian Cat'), findsOneWidget);
      expect(find.text('Calm, Gentle'), findsOneWidget);
      expect(find.text('Egypt'), findsOneWidget);

      // ✅ Verify favorite icon is displayed
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });
  });

  testWidgets('should tap favorite icon without errors',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetsCard(pet: fakePet),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // ✅ Simulate user tap on favorite icon
      await tester.tap(find.byIcon(Icons.favorite_border));
      await tester.pump();

      // ✅ Ensure widget still displays the icon
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    });
  });
}
