import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';import 'package:pet_finder_app/feature/home/data/repo/filter_repo.dart';

part 'filtered_state.dart';
part 'filtered_cubit.freezed.dart';

class FilteredCubit extends Cubit<FilteredState> {
  FilteredCubit(this.filterRepo) : super(FilteredState.initial());

  final FilterRepo filterRepo;

  
  Future<void> filterBreeds(String breed) async {
    emit(const FilteredState.loading());
    final result = await filterRepo.getFilteredBreeds(breed);
    result.when(
      success: (breeds) {
        emit(FilteredState.success(breeds));
      },
      failure: (error) {
        emit(FilteredState.error(error.message ?? 'no message'));
      },
    );
  }
}
