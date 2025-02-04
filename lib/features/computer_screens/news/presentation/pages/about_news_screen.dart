// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:tarbiyauz/core/colors/app_color.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/last_news_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';

class AboutNewsScreen extends StatefulWidget {
  String id;
  AboutNewsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AboutNewsScreen> createState() => _AboutNewsScreenState();
}

class _AboutNewsScreenState extends State<AboutNewsScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetByIdTwitesEvent(id: widget.id));
    context.read<HomeBloc>().add(GetMostTwitesEvent());
    context.read<HomeBloc>().add(GetLatestTwitesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    log('IDDD');
    log(widget.id);
    log('IDDD');

    return Scaffold(
        appBar: isSmallScreen
            ? null
            : CustomAppBar(
                scrollController: scrollController, onPressed: () {}),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == Status.Error) {
              return const CustomErrorWidget();
            }
            if (state.status == Status.Loading) {
              return const LoadingWidget();
            }
            if (state.status == Status.Success) {
              final twit = state.twit;
              return twit == null
                  ? const Center(
                      child: Text('ERROR'),
                    )
                  : isSmallScreen
                      ? _buildSmallScreenLayout(context, twit)
                      : _buildLargeScreenLayout(context, twit);
            }
            return Container();
          },
        ));
  }

  Widget _buildSmallScreenLayout(BuildContext context, TwitModel twit) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText(title: twit.title),
                const SizedBox(height: 16),
                _buildDescriptionText(texts: twit.texts),
                const SizedBox(height: 16),
                _buildImage(context, twit.photos.first.photoUrl),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return PhoneJobWidget(
                  twitModel: TwitModel(
                    createdAt: '',
                    id: '',
                    userId: '',
                    publisherFio: '',
                    type: '',
                    texts: '',
                    title: '',
                    readersCount: 0,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context, TwitModel twit) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(Theme.of(context).brightness);

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleText(fontSize: 30, title: twit.title),
                      const SizedBox(height: 16),
                      _buildDescriptionText(fontSize: 18, texts: twit.texts),
                      const SizedBox(height: 16),
                      _buildImage(context, twit.photos.first.photoUrl),
                    ],
                  ),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.status == Status.Success) {
                    final latest = state.latestTwites ?? [];
                    log('FROM UI');
                    log(latest.toString());
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: screenHeight * 0.5,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.01,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: latest.length,
                          itemBuilder: (context, index) {
                            final last = latest[index];
                            // return NewsWidgets(twitModel: last);
                            return Container(
                              width: screenWidth * 0.3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColor.blueColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppDimens.BORDER_RADIUS_20,
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: screenHeight * 0.3,
                                      width: double.infinity,
                                      child: _buildImageWithLoader(last)),
                                  20.hs(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      last.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  if (state.status == Status.Loading) {
                    return const LoadingWidget();
                  }
                  if (state.status == Status.Error) {
                    return const CustomErrorWidget();
                  }
                  return Container();
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: screenHeight * 0.1,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tavsiya Etamiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.status == Status.Loading) {
                    return const LoadingWidget();
                  }
                  if (state.status == Status.Error) {
                    return const CustomErrorWidget();
                  }
                  if (state.status == Status.Success) {
                    final mostViewved = state.mostVievedTwites ?? [];
                    log('MOSTED');
                    log(mostViewved.toString());
                    log('MOSTED');

                    return Flexible(
                      child: ListView.builder(
                        itemCount: mostViewved.length,
                        itemBuilder: (context, index) => LastNewsWidget(
                          twitModel: mostViewved[index],
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitleText({
    double fontSize = 24,
    required String title,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildDescriptionText({
    double fontSize = 16,
    required String texts,
  }) {
    return Text(
      texts,
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildImage(
    BuildContext context,
    String photoUrl,
  ) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimens.BORDER_RADIUS_15),
          bottom: Radius.circular(
            AppDimens.BORDER_RADIUS_15,
          )),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
      ),
    );
  }
}

Widget _buildImageWithLoader(TwitModel twitModel) {
  return FutureBuilder(
    future: _preloadImage(twitModel.photos.isNotEmpty &&
            twitModel.photos.first.photoUrl.isNotEmpty
        ? twitModel.photos.first.photoUrl
        : 'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg'),
    builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.asset(
            'assets/lottie/loading.json',
            width: 30,
            height: 30,
          ),
        );
      } else if (snapshot.hasError) {
        return Container(
          color: Colors.grey,
          child: const Center(child: Icon(Icons.error, size: 20)),
        );
      } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: snapshot.data!, fit: BoxFit.cover),
          ),
          // child: Image(
          //   image: ,
          //   width: double.infinity,
          //   height: double.infinity,
          //   fit: BoxFit.cover,
          // ),
        );
      }
    },
  );
}

/// Preloads Image to avoid flickering
Future<ImageProvider> _preloadImage(String url) async {
  final image = NetworkImage(url);
  final completer = Completer<void>();
  final listener = ImageStreamListener((_, __) => completer.complete());
  image.resolve(const ImageConfiguration()).addListener(listener);
  await completer.future;
  return image;
}
