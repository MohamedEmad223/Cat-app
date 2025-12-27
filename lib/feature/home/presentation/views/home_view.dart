import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/cubit/filtered_cubit.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:pet_finder_app/feature/home/presentation/cubit/cubit/home_state.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/app_bar_row.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/categories_list.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/lable_text.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/list_view_of_pets.dart';
import 'package:pet_finder_app/feature/home/presentation/widgets/search_text_form_feild.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarRow(),
                SizedBox(height: 16.h),
                SearchTextFormField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });

                    if (value.isEmpty) {
                      context.read<HomeCubit>().getBreeds();
                    } else {
                      context.read<FilteredCubit>().filterBreeds(value);
                    }
                  },
                ),
                SizedBox(height: 20.h),
                const LableText(title: 'Categories'),
                SizedBox(height: 10.h),
                const CategoriesList(),
                SizedBox(height: 20.h),
                searchQuery.isEmpty
                    ? BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const SizedBox.shrink(),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            success: (pets) => ListViewOfPets(pets: pets),
                            error: (message) => Center(child: Text(message)),
                          );
                        },
                      )
                    : BlocBuilder<FilteredCubit, FilteredState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const SizedBox.shrink(),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            success: (filteredPets) => ListViewOfPets(
                              pets: filteredPets,
                            ),
                            error: (message) => Center(child: Text(message)),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
