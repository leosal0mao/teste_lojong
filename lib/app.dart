import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      debugShowCheckedModeBanner: false,
      title: 'Lojong',
      routes: routes,
      theme: ThemeData(
        fontFamily: 'Asap',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
        ),
      ),
    );
  }
}
