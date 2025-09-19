import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/configs/assets/app_vectors.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_profileImage(), _gender(), _card()],
      ),
    );
  }

  _profileImage() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
    );
  }

  _gender() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          "Men",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  _card() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(AppVectors.bag, fit: BoxFit.none),
    );
  }
}
