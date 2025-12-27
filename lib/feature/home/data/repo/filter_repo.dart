import 'package:pet_finder_app/core/networking/api_error_handler.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/data/services/filter_service.dart';

class FilterRepo {
  final FilterService filterService;

  FilterRepo(this.filterService);
  Future<ApiResult<List<BreedModel>>> getFilteredBreeds(String breed) async {
    try {
      final response = await filterService.getFilteredBreeds(breed);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
