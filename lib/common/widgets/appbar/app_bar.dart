import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/configs/theme/app_colors.dart';

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
      toolbarHeight: height ?? 80,
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
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 50);
}
