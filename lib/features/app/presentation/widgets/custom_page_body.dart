import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';

class CustomPageBody extends StatelessWidget {
  final Widget child;
  const CustomPageBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
