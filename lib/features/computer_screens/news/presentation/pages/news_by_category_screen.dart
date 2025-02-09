// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/list_view_widgets.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/app_bar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';

class NewsByCategoryScreen extends StatefulWidget {
  final String category;

  const NewsByCategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<NewsByCategoryScreen> createState() => _NewsByCategoryScreenState();
}

class _NewsByCategoryScreenState extends State<NewsByCategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetLatestTwitesEvent());
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  void _toggleDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;
    // ignore: unused_local_variable
    double fontSize = MediaQuery.of(context).size.width * 0.015;
    // ignore: unused_local_variable
    return Scaffold(
      appBar: isSmallScreen
          ? const AppBarPhoneWidgetReal()
          : CustomAppBar(
              scrollController: _scrollController, onPressed: _toggleDrawer),
      body: isSmallScreen ? _smallScreen() : _largeScreen(),
    );
  }

  Widget _smallScreen() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
          final twites = state.typesTwites ?? [];

          ///EMTY WIDGET
          if (twites.isEmpty) {
            return const SliverToBoxAdapter(child: CustomErrorWidget());
          }

          return SliverList.builder(
            itemBuilder: (context, index) =>
                PhoneJobWidget(twitModel: twites[index]),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _largeScreen() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        // ignore: unused_local_variable
        double fontSize = screenWidth * 0.015;

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
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
                        final twites = state.typesTwites ?? [];

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
                  )
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.status == Status.Loading) {
                    return const LoadingWidget();
                  }
                  if (state.status == Status.Error) {
                    return const CustomErrorWidget();
                  }
                  if (state.status == Status.Success) {
                    return ListViewWidgets(
                      scrollController: _scrollController,
                      twites: state.latestTwites ?? [],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
