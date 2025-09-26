import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backGroundColor;
  final double? height;
  final bool hideBack;
  const BasicAppbar({
    super.key,
    this.title,
    this.action,
    this.backGroundColor,
    this.height,
    required this.hideBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: (height ?? 80).h,
      title: title ?? Text(""),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15.sp,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((height ?? 50).h);
}
