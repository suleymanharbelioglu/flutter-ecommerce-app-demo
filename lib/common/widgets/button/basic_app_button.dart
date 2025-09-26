import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  const BasicAppButton({
    super.key,
    required this.onPressed,
    this.title = "",
    this.content,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          (width ?? MediaQuery.of(context).size.width).w,
          (height ?? 50).h,
        ),
      ),
      child:
          content ??
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
    );
  }
}
