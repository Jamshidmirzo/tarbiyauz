import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/app_bar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';

class SearchResultScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  void _toggleDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    return Scaffold(
      appBar: isSmallScreen
          ? const AppBarPhoneWidgetReal()
          : CustomAppBar(
              scrollController: _scrollController, onPressed: _toggleDrawer),
      body: isSmallScreen
          ? _smallScreen()
          : CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      log(state.toString());
                      if (state.status == Status.Loading) {
                        return const SliverToBoxAdapter(
                          child: LoadingWidget(),
                        );
                      }

                      if (state.status == Status.Error) {
                        return const SliverToBoxAdapter(
                          child: CustomErrorWidget(),
                        );
                      }

                      if (state.status == Status.Success) {
                        final twites = state.searchedResultTwites ?? [];

                        ///EMTY WIDGET
                        if (twites.isEmpty) {
                          return const SliverToBoxAdapter(
                              child: CustomErrorWidget());
                        }

                        return SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth <= 1060 ? 2 : 3,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.5,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (context, index) =>
                                NewsWidgets(twitModel: twites[index]),
                            childCount: twites.length,
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _smallScreen() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == Status.Loading) {
          return const Center(child: LoadingWidget()); // ✅ FIXED
        }

        if (state.status == Status.Error) {
          return const Center(child: CustomErrorWidget()); // ✅ FIXED
        }

        if (state.status == Status.Success) {
          final twites = state.typesTwites ?? [];

          if (twites.isEmpty) {
            return const Center(child: CustomErrorWidget()); // ✅ FIXED
          }

          return ListView.builder(
            // ✅ FIXED
            padding: const EdgeInsets.all(16),
            itemCount: twites.length,
            itemBuilder: (context, index) =>
                PhoneJobWidget(twitModel: twites[index]),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
