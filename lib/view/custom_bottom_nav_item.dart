import 'package:dating_assignement/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItem extends StatelessWidget {
  const CustomBottomNavItem({
    super.key,
    required this.img,
    required this.title,
    required this.isActive,
  });
  final String img;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          img,
          height: 28,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(
              color: isActive ? AppColors.pink : AppColors.grayText,
              fontSize: 14),
        )
      ],
    );
  }
}
