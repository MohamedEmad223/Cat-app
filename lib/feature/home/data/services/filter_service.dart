import 'package:dio/dio.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'filter_service.g.dart';

@RestApi()
abstract class FilterService {
  factory FilterService(Dio dio, {String? baseUrl}) = _FilterService;

  @GET("breeds/search")
  Future<List<BreedModel>> getFilteredBreeds(
    @Query("q") String breed,
   
  );
}