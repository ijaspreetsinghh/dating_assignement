import 'package:dating_assignement/view/styles/app_colors.dart';
import 'package:flutter/material.dart';

class NoCardsWidget extends StatelessWidget {
  const NoCardsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '추천 드릴 친구들을 준비 중이에요',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '매일 새로운 친구들을 소개시켜드려요',
              style: TextStyle(
                color: AppColors.gray,
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}
