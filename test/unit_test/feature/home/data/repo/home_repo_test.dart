import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/data/repo/home_repo.dart';
import 'package:pet_finder_app/feature/home/data/services/home_service.dart';

import 'home_repo_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  late MockHomeService mockHomeService;
  late HomeRepo homeRepo;
  setUp(() {
    mockHomeService = MockHomeService();
    homeRepo = HomeRepo(homeService: mockHomeService);
  });

  group('HomeRepo Tests', () {
    test(' ApiSuccess when service call succeeds ', () async {
      // Arange

      final fakeResponse = BreedModel(
        id: "abys", name: "Abyssinian", origin: "Egypt"
      );
      when(mockHomeService.getBreeds(0, 1)).thenAnswer(
        (_) async => [fakeResponse],

        
      );

      // Act
      final result = await homeRepo.getBreeds(limit: 0, page: 1);
      expect(result, isA<ApiResult<List<BreedModel>>>());
      result.when(
        success: (data) {
          expect(data, isA<List<BreedModel>>());
          expect(data.first.name, equals("Abyssinian"));
          print(
            "✅ Success Test Passed - category: ${data.first.name}",
          );
        },
        failure: (error) {
          fail('Expected success but got failure: $error');
        },
      );
    });

    test(' ApiError when service call fails ', () async {
      // Arange

      when(mockHomeService.getBreeds(0, 1)).thenThrow(Exception("Failed to load breeds"));

      // Act
      final result = await homeRepo.getBreeds(limit: 0, page: 1);
      expect(result, isA<ApiResult<List<BreedModel>>>());
      result.when(
        success: (data) {
          fail('Expected failure but got success: $data');
        },
        failure: (error) {
          expect(error, isA<ApiErrorModel>());
                    print("❌ Error Test Passed - message: ${error.message}");

          expect(error.message, equals("Something went wrong"));
        },
      );

      verify(mockHomeService.getBreeds(0, 1)).called(1);
    });

  });
  }

