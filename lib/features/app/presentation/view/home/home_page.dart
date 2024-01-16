import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inspirações"),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 18),
            child: CustomTabBar(
                tabController: TabController(length: 3, vsync: this))),
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
