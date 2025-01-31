import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/core/widgets/bottom_nav_bar.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/pages/home_screen.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_news_screen.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_video_news_screen.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/search_result_screen.dart';

GoRouter createRouter(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  final bool isPhone = screenWidth <= 600;

  return GoRouter(
    initialLocation: isPhone ? Routes.bottomnavbar : Routes.homeScreen,
    routes: [
      GoRoute(
        path: Routes.aboutNewsScreen,
        name: Routes.aboutNewsScreen,
        builder: (context, state) => AboutNewsScreen(),
      ),
      GoRoute(
        path: Routes.bottomnavbar,
        name: Routes.bottomnavbar,
        builder: (context, state) => BottomNavBar(),
      ),
      GoRoute(
        path: Routes.aboutVideoNewsScreen,
        name: Routes.aboutVideoNewsScreen,
        builder: (context, state) => const AboutVideoNewsScreen(
          videoUrl: 'https://youtu.be/eR6sY8aQDKY',
        ),
      ),
      GoRoute(
        path: Routes.homeScreen,
        name: Routes.homeScreen,
        builder: (context, state) => const NewsScreen(),
      ),
      GoRoute(
        path: Routes.searchResult,
        name: Routes.searchResult,
        builder: (context, state) => SearchResultScreen(),
      ),
    ],
  );
}
