import 'package:json_annotation/json_annotation.dart';
import 'breed_model.dart'; 

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  final BreedModel breed; 
  final String? country;
  final int? popularity;

  FilterModel({
    required this.breed,
    this.country,
    this.popularity,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}
