import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/list_view_of_pets.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/pets_card.dart';

void main() {
  testWidgets('ListViewOfPets displays a list of PetsCard widgets correctly', (WidgetTester tester) async {
    final mockPets = [
      BreedModel(id: 'abys', name: 'Abyssinian', origin: 'Egypt'),
      BreedModel(id: 'aege', name: 'Aegean', origin: 'Greece'),
    ];

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          home: Scaffold(
            body: ListViewOfPets(pets: mockPets),
          ),
        ),
      ),
    );

    expect(find.byType(ListView), findsOneWidget); 
    expect(find.byType(PetsCard), findsNWidgets(2)); 

    expect(find.text('Abyssinian'), findsOneWidget);
    expect(find.text('Aegean'), findsOneWidget);
  });
}


