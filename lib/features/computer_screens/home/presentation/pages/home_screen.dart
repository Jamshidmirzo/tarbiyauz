// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/widgets/bottom_nav_bar.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/drawer_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/is_computer_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  void _toggleDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isPhone = screenWidth <= 480;
    log(screenWidth.toString());

    return Scaffold(
      // backgroundColor: Color(0xFF121212),
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      appBar: isPhone
          ? null
          : CustomAppBar(
              scrollController: _scrollController,
              onPressed: _toggleDrawer,
            ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.PADDING_20,
              left: AppDimens.PADDING_20,
              right: AppDimens.PADDING_20,
            ),
            child: isPhone
                ? BottomNavBar()
                : IsComputerWidget(scrollController: _scrollController),
          ),
          // Uncomment if needed
          // AnimatedContaierWidget(
          //   isDrawerOpen: _isDrawerOpen,
          //   toggleDrawer: _toggleDrawer,
          // ),
        ],
      ),
    );
  }
}
