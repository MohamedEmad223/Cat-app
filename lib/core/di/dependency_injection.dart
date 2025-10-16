import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/core/networking/dio_factory.dart';
import 'package:pet_finder_app/feature/home/data/repo/home_repo.dart';
import 'package:pet_finder_app/feature/home/data/services/home_service.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_cubit.dart';


final getIt = GetIt.instance;

initDependency() {
  _setupDependencies();
}

_setupDependencies(){
    getIt.registerSingleton<Dio>(DioFactory().dio);

    //breeds
  getIt.registerSingleton<HomeService>(HomeService(getIt()));
  getIt.registerSingleton<HomeRepo>(
   HomeRepo(homeService: getIt()),
  );
   getIt.registerFactory<HomeCubit>(
    () => HomeCubit(getIt()),
  );

}