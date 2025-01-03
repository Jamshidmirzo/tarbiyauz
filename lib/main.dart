import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/currency/presentation/blocs/bloc/converter_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/pages/home_screen.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_news_screen.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_video_news_screen.dart';
import 'package:tarbiyauz/core/widgets/bottom_nav_bar.dart';
import 'service_locator.dart' as di;

void main(List<String> args) async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth <= 600;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ConverterBloc>(),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp(
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            home: isPhone ? const BottomNavBar() : const NewsScreen(),
            routes: {
              '/homeScreen': (context) => const NewsScreen(),
              '/aboutVideoNews': (context) => const AboutVideoNewsScreen(
                    videoUrl: 'https://youtu.be/ecnTLjeSgEM',
                  ),
              '/aboutNews': (context) => AboutNewsScreen(),
            },
          );
        },
      ),
    );
  }
}
