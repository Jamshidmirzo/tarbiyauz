import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/routes/app_routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'service_locator.dart' as di;

void main(List<String> args) async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<HomeBloc>(),
        ),
      ],
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp.router(
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: createRouter(context),
          );
        },
      ),
    );
  }
}
