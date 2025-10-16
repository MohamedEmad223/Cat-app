import 'package:pet_finder_app/core/networking/api_error_handler.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/data/services/home_service.dart';

class HomeRepo {
  final HomeService homeService;

  HomeRepo({required this.homeService});

  Future<ApiResult<List<BreedModel>>> getBreeds({limit,page}) async {
    try {
      final response = await homeService.getBreeds(limit, page);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
