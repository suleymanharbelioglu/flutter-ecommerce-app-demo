import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/bloc/category/categories_display_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/category/categories_display_state.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return CircularProgressIndicator();
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [_seeAll(), SizedBox(height: 20), _categories()],
            );
          }
          return Container();
        },
      ),
    );
  }

  _seeAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "See All",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ],
      ),
    );
  }

  _categories() {
    return Container(
      height: 100,
      color: Colors.transparent,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 18),
              Text("title"),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 15);
        },
        itemCount: 10,
      ),
    );
  }
}
