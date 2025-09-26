import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/presentation/home/widgets/categories.dart';
import 'package:flutter_ecommerce_app/presentation/home/widgets/header.dart';
import 'package:flutter_ecommerce_app/presentation/home/widgets/new_in.dart';
import 'package:flutter_ecommerce_app/presentation/home/widgets/search_field.dart';
import 'package:flutter_ecommerce_app/presentation/home/widgets/top_selling.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), // responsive padding
          child: Column(
            children: [
              Header(),
              SizedBox(height: 24.h),
              SearchField(),
              SizedBox(height: 24.h),
              Categories(),
              SizedBox(height: 24.h),
              TopSelling(),
              SizedBox(height: 24.h),
              NewIn(),
            ],
          ),
        ),
      ),
    );
  }
}
