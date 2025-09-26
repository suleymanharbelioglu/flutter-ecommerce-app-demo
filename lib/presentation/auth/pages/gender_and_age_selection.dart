import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_cubit.dart';
import 'package:flutter_ecommerce_app/common/bloc/button/button_state.dart';
import 'package:flutter_ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:flutter_ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:flutter_ecommerce_app/common/widgets/appbar/app_bar.dart';
import 'package:flutter_ecommerce_app/common/widgets/button/basic_reactive_button.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_ecommerce_app/data/auth/model/user_creation_req.dart';
import 'package:flutter_ecommerce_app/domain/auth/usecases/siginup.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:flutter_ecommerce_app/presentation/home/pages/home.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: false),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => ButtonStateCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemove(context, HomePage());
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    SizedBox(height: 30.h),
                    _genders(context),
                    SizedBox(height: 30.h),
                    howOld(),
                    SizedBox(height: 30.h),
                    _age(),
                  ],
                ),
              ),
              Spacer(),
              _finishButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      'Tell us about yourself',
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            genderTile(context, 1, 'Men'),
            SizedBox(width: 20.w),
            genderTile(context, 2, 'Women'),
          ],
        );
      },
    );
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color:
                context.read<GenderSelectionCubit>().selectedIndex ==
                    genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }

  Widget howOld() {
    return Text(
      'How old are you?',
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                  BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges(),
                  ),
                ],
                child: Ages(),
              ),
            );
          },
          child: Container(
            height: 60.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state),
                Icon(Icons.keyboard_arrow_down, size: 24.sp),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100.h,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Builder(
          builder: (context) {
            return BasicReactiveButton(
              onPressed: () {
                if (context.read<AgeSelectionCubit>().selectedAge.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select your age range')),
                  );
                  return;
                }

                userCreationReq.gender = context
                    .read<GenderSelectionCubit>()
                    .selectedIndex;
                userCreationReq.age = context
                    .read<AgeSelectionCubit>()
                    .selectedAge;

                context.read<ButtonStateCubit>().execute(
                  usecase: SignupUseCase(),
                  params: userCreationReq,
                );
              },
              title: 'Finish',
            );
          },
        ),
      ),
    );
  }
}
