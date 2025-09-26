import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/ages_display_state.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height / 2.7, // ekranın yaklaşık yarısı
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AgesLoaded) {
            return _ages(context, state.ages);
          }
          if (state is AgesLoadFailure) {
            return Center(
              child: Text(state.message, style: TextStyle(fontSize: 16.sp)),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Widget _ages(
    BuildContext context,
    List<QueryDocumentSnapshot<Map<String, dynamic>>> ages,
  ) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: ages.length,
      separatorBuilder: (_, __) => SizedBox(height: 20.h),
      itemBuilder: (context, index) {
        final ageValue = ages[index].data()["value"];
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectAge(ageValue);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(ageValue, style: TextStyle(fontSize: 18.sp)),
          ),
        );
      },
    );
  }
}
