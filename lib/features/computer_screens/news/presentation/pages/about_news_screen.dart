// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    log(screenWidth.toString());
    return Expanded(
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
                  SizedBox(
                      height: screenHeight * 0.75,
                      width: screenWidth,
                      child: _buildImage(context, twit.photos.first.photoUrl)),
                  SizedBox(
                    height: screenWidth * 0.02,
                  ),
                  Row(
                    children: [
                      _buildTitleText(fontSize: 30, title: twit.title),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            LucideIcons.eye,
                            color: Colors.white.withOpacity(0.9),
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${twit.readersCount} views',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  _buildDescriptionText(fontSize: 18, texts: twit.texts),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitleText(title: 'Eng Saralari'),
                  SizedBox(
                    height: screenWidth * 0.02,
                  )
                ],
              ),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.status == Status.Success) {
                final latest = state.mostVievedTwites ?? [];

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
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
    );

    // return Row(
    //   children: [
    //     Expanded(
    //       flex: 4,
    //       child: CustomScrollView(
    //         slivers: [
    //           SliverToBoxAdapter(
    //             child: Padding(
    //               padding: EdgeInsets.symmetric(
    //                 horizontal: screenWidth * 0.02,
    //                 vertical: screenHeight * 0.05,
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   _buildTitleText(fontSize: 30, title: twit.title),
    //                   const SizedBox(height: 16),
    //                   _buildDescriptionText(fontSize: 18, texts: twit.texts),
    //                   const SizedBox(height: 16),
    //                   SizedBox(
    //                       height: (screenWidth) / 2,
    //                       width: screenWidth,
    //                       child:
    //                           _buildImage(context, twit.photos.first.photoUrl)),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           BlocBuilder<HomeBloc, HomeState>(
    //             builder: (context, state) {
    //               if (state.status == Status.Success) {
    //                 final latest = state.latestTwites ?? [];
    //                 log('FROM UI');
    //                 log(latest.toString());
    //                 return SliverToBoxAdapter(
    //                   child: SizedBox(
    //                     height: screenHeight * 0.5,
    //                     child: ListView.builder(
    //                       padding: EdgeInsets.only(
    //                         left: screenWidth * 0.01,
    //                       ),
    //                       scrollDirection: Axis.horizontal,
    //                       itemCount: latest.length,
    //                       itemBuilder: (context, index) {
    //                         final last = latest[index];
    //                         // return NewsWidgets(twitModel: last);
    //                         return Container(
    //                           width: screenWidth * 0.3,
    //                           margin:
    //                               const EdgeInsets.symmetric(horizontal: 8.0),
    //                           decoration: BoxDecoration(
    //                             color: Theme.of(context).brightness ==
    //                                     Brightness.dark
    //                                 ? AppColor.blueColor
    //                                 : Colors.white,
    //                             borderRadius: BorderRadius.circular(
    //                               AppDimens.BORDER_RADIUS_20,
    //                             ),
    //                           ),
    //                           child: Column(
    //                             children: [
    //                               SizedBox(
    //                                   height: screenHeight * 0.3,
    //                                   width: double.infinity,
    //                                   child: _buildImageWithLoader(last)),
    //                               20.hs(),
    //                               Padding(
    //                                 padding: const EdgeInsets.all(8.0),
    //                                 child: Text(
    //                                   last.title,
    //                                   style: const TextStyle(
    //                                       fontWeight: FontWeight.bold,
    //                                       fontSize: 20),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                 );
    //               }
    //               if (state.status == Status.Loading) {
    //                 return const LoadingWidget();
    //               }
    //               if (state.status == Status.Error) {
    //                 return const CustomErrorWidget();
    //               }
    //               return Container();
    //             },
    //           ),
    //           SliverToBoxAdapter(
    //             child: SizedBox(
    //               height: screenHeight * 0.1,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),

    //     // Expanded(
    //     //   child: Column(
    //     //     crossAxisAlignment: CrossAxisAlignment.start,
    //     //     children: [
    //     //       const Padding(
    //     //         padding: EdgeInsets.all(8.0),
    //     //         child: Text(
    //     //           'Tavsiya Etamiz',
    //     //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //     //         ),
    //     //       ),
    //     //       BlocBuilder<HomeBloc, HomeState>(
    //     //         builder: (context, state) {
    //     //           if (state.status == Status.Loading) {
    //     //             return const LoadingWidget();
    //     //           }
    //     //           if (state.status == Status.Error) {
    //     //             return const CustomErrorWidget();
    //     //           }
    //     //           if (state.status == Status.Success) {
    //     //             final mostViewved = state.mostVievedTwites ?? [];
    //     //             log('MOSTED');
    //     //             log(mostViewved.toString());
    //     //             log('MOSTED');

    //     //             return Flexible(
    //     //               child: ListView.builder(
    //     //                 itemCount: mostViewved.length,
    //     //                 itemBuilder: (context, index) => LastNewsWidget(
    //     //                   twitModel: mostViewved[index],
    //     //                 ),
    //     //               ),
    //     //             );
    //     //           }
    //     //           return Container();
    //     //         },
    //     //       )
    //     //     ],
    //     //   ),
    //     // ),

    //   ],
    // );
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

  Widget _buildImage(BuildContext context, String? photoUrl) {
    return photoUrl != null && photoUrl.isNotEmpty
        ? Image.network(
            photoUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50,
                ),
              );
            },
          )
        : const Center(
            child: Icon(
              Icons.broken_image,
              color: Colors.red,
              size: 50,
            ),
          );
  }
}

Widget _buildImageWithLoader(TwitModel twitModel) {
  String imageUrl =
      'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg';

  if (twitModel.photos != null &&
      twitModel.photos.isNotEmpty &&
      twitModel.photos.first.photoUrl.isNotEmpty) {
    imageUrl = twitModel.photos.first.photoUrl;
  }

  return FutureBuilder<ImageProvider>(
    future: _preloadImage(imageUrl),
    builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: Lottie.asset(
            'assets/lottie/loading.json',
            width: 30,
            height: 30,
          ),
        );
      } else if (snapshot.hasError || !snapshot.hasData) {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Icon(Icons.error, size: 30, color: Colors.red),
          ),
        );
      } else {
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: snapshot.data!,
              fit: BoxFit.cover,
            ),
          ),
        );
      }
    },
  );
}

Future<ImageProvider> _preloadImage(String url) async {
  try {
    final image = NetworkImage(url);
    final completer = Completer<void>();
    final listener = ImageStreamListener(
      (ImageInfo image, bool synchronousCall) {
        completer.complete();
      },
      onError: (error, stackTrace) {
        completer.completeError(error);
      },
    );

    image.resolve(const ImageConfiguration()).addListener(listener);
    await completer.future;
    return image;
  } catch (e) {
    return const AssetImage(
        'assets/images/placeholder.png'); // Use a local fallback image
  }
}
