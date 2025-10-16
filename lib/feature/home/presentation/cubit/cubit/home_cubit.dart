import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/repo/home_repo.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  final HomeRepo homeRepo;

  Future<void> getBreeds({int limit = 20, int page = 0}) async {
    emit(const HomeState.loading());
    final result = await homeRepo.getBreeds(limit: limit, page: page);
    result.when(
      success: (breeds) {
        emit(HomeState.success(breeds));
      },
      failure: (error) {
        emit(HomeState.error(error.message ?? 'no message'));
      },
    );
  }
}
