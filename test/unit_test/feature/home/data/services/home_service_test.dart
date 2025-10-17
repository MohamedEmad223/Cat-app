import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/data/services/home_service.dart';

import 'home_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late HomeService homeService;

  setUp(() {
    mockDio = MockDio();
    when(mockDio.options).thenReturn(BaseOptions());
    homeService = HomeService(mockDio);
    log('🧩 Setup complete — MockDio and HomeService initialized');
  });

  test('getBreeds returns List<BreedModel>', () async {
    log('🚀 Starting test: getBreeds returns valid model');

    final responsePayload = [
      {
        "id": "abys",
        "name": "Abyssinian",
        "wikipedia_url": "https://en.wikipedia.org/wiki/Abyssinian_(cat)",
      },
    ];

    when(mockDio.fetch<List<dynamic>>(any)).thenAnswer(
      (_) async => Response<List<dynamic>>(
        requestOptions: RequestOptions(path: '/breeds'),
        data: responsePayload,
        statusCode: 200,
      ),
    );

    print('📡 Calling service.getBreeds() ...');
    final result = await homeService.getBreeds(0, 1);

    print('✅ Response received successfully');
    print('📊 Breed name: ${result.first.name}');
    print('📸 Cover URL: ${result.first.name}');

    expect(result, isA<List<BreedModel>>());
    expect(result.first.name, equals("Abyssinian"));

    print('🎉 Test passed — All expectations met');
  });
}
