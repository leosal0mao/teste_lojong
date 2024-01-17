import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class CustomTabBar extends StatefulWidget {
  final TabController tabController;
  const CustomTabBar({super.key, required this.tabController});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
      child: Container(
        height: size.height / 20,
        decoration: BoxDecoration(
          color: AppColors.shadowColor,
          borderRadius: BorderRadius.circular(
            25.0,
          ),
        ),
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              40.0,
            ),
            color: Colors.white,
          ),
          dividerColor: AppColors.transparent,
          labelColor: AppColors.mainColor,
          unselectedLabelColor: Colors.white,
          padding: const EdgeInsets.all(3),
          controller: widget.tabController,
          labelStyle: const TextStyle(fontWeight: FontWeight.w700),
          tabs: const [
            Tab(text: 'Vídeos'),
            Tab(text: 'Artigos'),
            Tab(text: 'Citações'),
          ],
        ),
      ),
    );
  }
}
