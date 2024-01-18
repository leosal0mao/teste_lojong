import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ops!',
            style: TextStyle(
                color: AppColors.titleColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'Não foi possivel conectar ao servidor, verifique se está conectado a internet.',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.titleColor, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
