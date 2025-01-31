// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.015;
    double screenWidth = MediaQuery.of(context).size.width;

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
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimens.PADDING_20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Minim occaecat consequat commodo dolor anim labore reprehenderit do ut. Esse id eiusmod ea esse est ut. Cupidatat cillum adipisicing.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize * 1,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                'Minim occaecat consequat commodo dolor anim labore reprehenderit do ut. Esse id eiusmod ea esse est ut. Cupidatat cillum adipisicing amet officia nostrud culpa eu ut culpa magna Lorem veniam sunt amet.',
                                style: TextStyle(fontSize: fontSize * 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppDimens.BORDER_RADIUS_20),
                        child: Image.network(
                          'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: const Center(child: Icon(Icons.error)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  log(state.toString());

                  if (state.status == Status.Loading) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state.status == Status.Error) {
                    return const SliverToBoxAdapter(
                      child: Center(
                          child:
                              Text('Failed to load tweets. Please try again.')),
                    );
                  }

                  if (state.status == Status.Success) {
                    final twites = state.twites ?? [];
                    if (twites.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(child: Text('No tweets available.')),
                      );
                    }

                    return screenWidth <= 1060
                        ? SliverGrid(
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
                          )
                        : SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 1.5,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return NewsWidgets(twitModel: twites[index]);
                              },
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
        20.ws(),
        Flexible(
          child: ListViewWidgets(scrollController: widget.scrollController),
        ),
      ],
    );
  }
}
