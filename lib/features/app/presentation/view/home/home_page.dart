import 'package:flutter/material.dart';
import 'package:teste_lojong/core/constants/colors.dart';
import 'package:teste_lojong/features/app/presentation/view/articles/articles_page.dart';
import 'package:teste_lojong/features/app/presentation/view/quotes/quotes_page.dart';
import 'package:teste_lojong/features/app/presentation/view/videos/videos_page.dart';
import 'package:teste_lojong/features/app/presentation/widgets/custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        title: Text(
          "INSPIRAÇÕES",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 18),
            child: CustomTabBar(tabController: _tabController!)),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          VideosPage(),
          ArticlesPage(),
          QuotesPage(),
        ],
      ),
    );
  }
}
