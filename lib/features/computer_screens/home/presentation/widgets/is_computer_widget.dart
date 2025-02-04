// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/list_view_widgets.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';

class IsComputerWidget extends StatefulWidget {
  final ScrollController scrollController;
  const IsComputerWidget({
    super.key,
    required this.scrollController,
  });

  @override
  State<IsComputerWidget> createState() => _IsComputerWidgetState();
}

class _IsComputerWidgetState extends State<IsComputerWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetAllTwitesEvent());
    context.read<HomeBloc>().add(GetLatestTwitesEvent());
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.015;
    double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double fontSize = screenWidth * 0.015;

        return Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomScrollView(
                controller: widget.scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        borderRadius:
                            BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(AppDimens.PADDING_20),
                                child: Text(
                                  'Minim occaecat consequat commodo dolor anim labore reprehenderit do ut. Esse id eiusmod ea esse est ut. Cupidatat cillum adipisicing.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SliverPadding(padding: EdgeInsets.only(top: 20)),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.status == Status.Loading) {
                        return const SliverToBoxAdapter(
                          child: LoadingWidget(),
                        );
                      }

                      if (state.status == Status.Error) {
                        return const SliverToBoxAdapter(
                          child: Center(child: Text('Failed to load tweets.')),
                        );
                      }

                      if (state.status == Status.Success) {
                        final twites = state.twites ?? [];

                        if (twites.isEmpty) {
                          return const SliverToBoxAdapter(
                            child: Center(child: Text('No tweets available.')),
                          );
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
                      scrollController: widget.scrollController,
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
