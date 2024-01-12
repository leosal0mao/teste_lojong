import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_lojong/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lojong',
      routes: routes,
    );
    ;
  }
}
