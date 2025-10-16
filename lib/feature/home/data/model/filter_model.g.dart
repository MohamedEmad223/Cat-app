// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
  breed: BreedModel.fromJson(json['breed'] as Map<String, dynamic>),
  country: json['country'] as String?,
  popularity: (json['popularity'] as num?)?.toInt(),
);

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'breed': instance.breed,
      'country': instance.country,
      'popularity': instance.popularity,
    };
