import 'package:dio/dio.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:retrofit/retrofit.dart';


part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String? baseUrl}) = _HomeService;

  @GET("breeds")
  Future<List<BreedModel>> getBreeds(
    @Query('limit') int limit,
    @Query('page') int page,
  );
}