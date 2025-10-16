import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/feature/home/data/model/breed_model.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/pets_card.dart';

class ListViewOfPets extends StatelessWidget {
  const ListViewOfPets({super.key, required this.pets});
  final List<BreedModel> pets;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pets.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        final pet = pets[index];
        return PetsCard(pet: pet);
      },
    );
  }
}
