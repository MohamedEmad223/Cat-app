import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/data/repo/home_repo.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_state.dart';

import 'home_cubit_test.mocks.dart';


@GenerateMocks([HomeRepo])
void main() {
  late MockHomeRepo mockHomeRepo;
  late HomeCubit homeCubit;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    homeCubit = HomeCubit(mockHomeRepo);
  });

  tearDown(() async {
    await homeCubit.close();
  });

  group('HomeCubit Tests', () {
    test('should emit [loading, success] when getBreeds succeeds', () async {
      // Arrange
      final breeds = [BreedModel(id: 'abys', name: 'Abyssinian', origin: 'Egypt')];
      when(mockHomeRepo.getBreeds(limit: anyNamed('limit'), page: anyNamed('page')))
          .thenAnswer((_) async => ApiResult.success(breeds));

      // Assert
      expectLater(
        homeCubit.stream,
        emitsInOrder([
          const HomeState.loading(),
          HomeState.success(breeds),
        ]),
      );

      // Act
      await homeCubit.getBreeds();
    });

    test('should emit [loading, error] when getBreeds fails', () async {
      // Arrange
      final error = ApiErrorModel(message: 'Failed to load breeds', errors: [], statusCode: null, icon: null);
      when(mockHomeRepo.getBreeds(limit: anyNamed('limit'), page: anyNamed('page')))
          .thenAnswer((_) async => ApiResult.failure(error));

      // Assert
      expectLater(
        homeCubit.stream,
        emitsInOrder([
          const HomeState.loading(),
          const HomeState.error('Failed to load breeds'),
        ]),
      );

      // Act
      await homeCubit.getBreeds();
    });
  });
}
