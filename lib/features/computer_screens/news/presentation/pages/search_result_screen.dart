import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';

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
          ? null
          : CustomAppBar(
              scrollController: _scrollController, onPressed: _toggleDrawer),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<HomeBloc, HomeState>(
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
                final twites = state.twites ?? [];

                ///EMTY WIDGET
                if (twites.isEmpty) {
                  return const SliverToBoxAdapter(child: CustomErrorWidget());
                }

                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth <= 1060 ? 2 : 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => NewsWidgets(twitModel: twites[index]),
                    childCount: twites.length,
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
