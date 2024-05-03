import 'package:dating_assignement/view/custom_bottom_nav_item.dart';
import 'package:dating_assignement/view/no_cards_widget.dart';
import 'package:dating_assignement/view/styles/app_colors.dart';
import 'package:dating_assignement/view/swipe_able_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final List<String> images = [
  'assets/images/g_1.png',
  'assets/images/g_2.png',
  'assets/images/g_3.png',
  'assets/images/g_1.png',
  'assets/images/g_2.png',
];

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final RxList cardItems = ['key_1', 'key_2', 'key_3', 'key_4', 'key_5'].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/gps.png'),
            const SizedBox(
              width: 6,
            ),
            const Text(
              '목이길어슬픈기린님의 새로운 스팟',
              style: TextStyle(color: AppColors.white, fontSize: 11),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.bordergray,
                ),
                color: AppColors.black),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/star.png'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '323,233',
                  style: TextStyle(color: AppColors.white, fontSize: 11),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/images/bell.png',
            height: 40,
            width: 40,
          ),
        ],
      ),
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Obx(
          () => cardItems.isEmpty
              ? const NoCardsWidget()
              : PageView.builder(
                  itemBuilder: (context, index) => SwipeableCard(
                    onRemove: () {
                      cardItems.removeAt(index);
                    },
                    item: ProfileCard(),
                    key: Key(cardItems[index]),
                  ),
                  itemCount: cardItems.length,
                  controller: PageController(viewportFraction: .87),
                ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 74,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: const BoxDecoration(
              color: AppColors.black,
              border: Border(
                top: BorderSide(
                  color: AppColors.bordergray,
                ),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomBottomNavItem(
                    img: 'assets/images/home_filled.png',
                    title: '홈',
                    isActive: true),
                const CustomBottomNavItem(
                    img: 'assets/images/gps_outlined.png',
                    title: '스팟',
                    isActive: false),
                Container(
                  width: 30,
                ),
                const CustomBottomNavItem(
                    img: 'assets/images/chat.png',
                    title: '채팅',
                    isActive: false),
                const CustomBottomNavItem(
                    img: 'assets/images/user.png',
                    title: '마이',
                    isActive: false),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -16, 0),
                height: 70,
                width: 70,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  border: Border(
                    top: BorderSide(
                      color: AppColors.bordergray,
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Image.asset(
                  'assets/images/big_star.png',
                  height: 74,
                  width: 74,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});
  final RxInt imgIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.bordergray),
            image: DecorationImage(
                image: AssetImage(
                  images[imgIndex.value],
                ),
                fit: BoxFit.cover),
          ),
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          height: double.maxFinite,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.6, 1],
                colors: [
                  const Color(0xff000000).withOpacity(0),
                  const Color(0xff000000).withOpacity(1)
                ],
              ),
            ),
            child: LayoutBuilder(builder: (context, stackSize) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LayoutBuilder(builder: (context, barSize) {
                        return Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  width: (barSize.maxWidth - 32) * 0.19,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: imgIndex.value == 0
                                          ? AppColors.pink
                                          : AppColors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width: (barSize.maxWidth - 32) * 0.18,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: imgIndex.value == 1
                                          ? AppColors.pink
                                          : AppColors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width: (barSize.maxWidth - 32) * 0.18,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: imgIndex.value == 2
                                          ? AppColors.pink
                                          : AppColors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width: (barSize.maxWidth - 32) * 0.18,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: imgIndex.value == 3
                                          ? AppColors.pink
                                          : AppColors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Container(
                                  width: (barSize.maxWidth - 32) * 0.18,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: imgIndex.value == 4
                                          ? AppColors.pink
                                          : AppColors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                              ],
                            ));
                      }).marginOnly(top: 16),
                      Row(
                        children: [
                          InkWell(
                              borderRadius: BorderRadius.circular(18),
                              onTap: () {
                                if (imgIndex.value > 0) {
                                  imgIndex.value--;
                                }
                              },
                              child: SizedBox(
                                height: 200,
                                width: stackSize.maxWidth / 2,
                              )),
                          InkWell(
                              borderRadius: BorderRadius.circular(18),
                              onTap: () {
                                if (imgIndex.value < 4) {
                                  imgIndex.value++;
                                }
                              },
                              child: SizedBox(
                                height: 200,
                                width: stackSize.maxWidth / 2,
                              ))
                        ],
                      ),
                    ],
                  ),
                  Obx(() => imgIndex.value == 0
                      ? const ProfileOne()
                      : imgIndex.value == 1
                          ? const ProfileTwo()
                          : imgIndex.value == 2
                              ? const ProfileThree()
                              : imgIndex.value == 3
                                  ? const ProfileOne()
                                  : const ProfileTwo())
                ],
              );
            }),
          ),
        ));
  }
}

class ProfileThree extends StatelessWidget {
  const ProfileThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/star.png').marginOnly(right: 6),
              const Text(
                '29,930',
                style: TextStyle(color: AppColors.white, fontSize: 12),
              ),
            ],
          ),
        ).marginOnly(bottom: 4),
        const Text(
          '잭과분홍콩나물 25',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ).marginOnly(bottom: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  CustomBigChip(
                    fillColor: AppColors.pink.withOpacity(.15),
                    borderColor: AppColors.pink,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '💖 진지한 연애를 찾는 중',
                          style: TextStyle(color: AppColors.pink, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  CustomBigChip(
                    fillColor: AppColors.dark.withOpacity(.8),
                    borderColor: AppColors.bordergray,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '🍸 전혀 안 함',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  CustomBigChip(
                    fillColor: AppColors.dark.withOpacity(.8),
                    borderColor: AppColors.bordergray,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '🚬 비흡연',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  CustomBigChip(
                    fillColor: AppColors.dark.withOpacity(.8),
                    borderColor: AppColors.bordergray,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '💪 매일 1시간 이상',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  CustomBigChip(
                    fillColor: AppColors.dark.withOpacity(.8),
                    borderColor: AppColors.bordergray,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '🤝 만나는 걸 좋아함',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  CustomBigChip(
                    fillColor: AppColors.dark.withOpacity(.8),
                    borderColor: AppColors.bordergray,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'INFP',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/heart.png',
              height: 48,
            ).marginOnly(left: 8)
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.white,
            ),
          ],
        ),
      ],
    ).marginAll(24);
  }
}

class ProfileTwo extends StatelessWidget {
  const ProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/star.png').marginOnly(right: 6),
              const Text(
                '29,930',
                style: TextStyle(color: AppColors.white, fontSize: 12),
              ),
            ],
          ),
        ).marginOnly(bottom: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '잭과분홍콩나물 25',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/heart.png',
              height: 48,
            ).marginOnly(left: 8)
          ],
        ).marginOnly(bottom: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.white,
            ),
          ],
        ),
      ],
    ).marginAll(24);
  }
}

class ProfileOne extends StatelessWidget {
  const ProfileOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(100)),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/star.png').marginOnly(right: 6),
              const Text(
                '29,930',
                style: TextStyle(color: AppColors.white, fontSize: 12),
              ),
            ],
          ),
        ).marginOnly(bottom: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '잭과분홍콩나물 25',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '서울 · 2km 거리에 있음',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.gray,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/heart.png',
              height: 48,
            ).marginOnly(left: 8)
          ],
        ).marginOnly(bottom: 12),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.white,
            ),
          ],
        ),
      ],
    ).marginAll(24);
  }
}

class CustomBigChip extends StatelessWidget {
  const CustomBigChip(
      {super.key,
      required this.fillColor,
      required this.borderColor,
      required this.child});
  final Color fillColor;
  final Color borderColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      child: child,
    );
  }
}
