part of 'filtered_cubit.dart';

@freezed
class FilteredState with _$FilteredState {
  const factory FilteredState.initial() = _Initial;
  const factory FilteredState.loading() = Loading;
  const factory FilteredState.success(List<BreedModel> filteredBreeds) = Success;
  const factory FilteredState.error(String message) = Error;
}
