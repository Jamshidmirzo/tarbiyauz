// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, deprecated_member_use
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
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/app_bar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/appbar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class AboutNewsScreen extends StatefulWidget {
  String id;

  // ignore: use_super_parameters
  AboutNewsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<AboutNewsScreen> createState() => _AboutNewsScreenState();
}

class _AboutNewsScreenState extends State<AboutNewsScreen> {
  final ScrollController scrollController = ScrollController();
  late String videoId;
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetByIdTwitesEvent(id: widget.id));
    context.read<HomeBloc>().add(GetMostTwitesEvent());
    context.read<HomeBloc>().add(GetLatestTwitesEvent());
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final id = ModalRoute.of(context)!.settings.arguments as String?;
  //   if (id != null && id != widget.id) {
  //     setState(() {
  //       widget.id = id;
  //     });
  //     context.read<HomeBloc>().add(GetByIdTwitesEvent(id: widget.id));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    double fontSizee = MediaQuery.of(context).size.width * 0.015;

    return Scaffold(
        appBar: isSmallScreen
            ? const AppBarPhoneWidgetReal()
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
              log(twit.toString());
              return twit == null
                  ? const Center(
                      child: Text('ERROR'),
                    )
                  : isSmallScreen
                      ? _buildSmallScreenLayout(context, twit)
                      : _buildLargeScreenLayout(context, twit, fontSizee);
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
            padding: const EdgeInsets.all(16), // Simplified padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(
                    context,
                    twit.photos.isNotEmpty
                        ? twit.photos.first.photoUrl
                        : 'https://via.placeholder.com/150'),
                const SizedBox(height: 16),
                _buildTitleText(title: twit.title),
                const SizedBox(height: 16),
                _buildDescriptionText(texts: twit.texts),
                const SizedBox(height: 16),
                _buildTitleText(title: 'Eng Saralari'),
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
                    padding: EdgeInsets.only(left: screenWidth * 0.01),
                    itemCount: latest.length,
                    itemBuilder: (context, index) {
                      final last = latest[index];
                      return PhoneJobWidget(twitModel: last);
                    },
                  ),
                ),
              );
            }
            if (state.status == Status.Loading) {
              return const SliverToBoxAdapter(child: LoadingWidget());
            }
            if (state.status == Status.Error) {
              return const SliverToBoxAdapter(child: CustomErrorWidget());
            }
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }

  Widget _buildLargeScreenLayout(
      BuildContext context, TwitModel twit, double fontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomScrollView(
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
                    child: _buildMedia(context, twit)),
                SizedBox(
                  height: screenWidth * 0.02,
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: screenWidth / 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: _buildTitleText(
                                    fontSize: fontSize * 1.2,
                                    title: twit.title),
                              ),
                              const Spacer(),
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
                          _buildDescriptionText(
                              fontSize: fontSize * 1, texts: twit.texts),
                        ],
                      ),
                    )
                  ],
                )
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
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<HomeBloc>()
                              .add(GetByIdTwitesEvent(id: last.id));
                          // context
                          //     .replace('${Routes.aboutNewsScreen}/${last.id}');
                        },
                        child: Container(
                          height: screenWidth * 0.3,
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
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: fontSize),
                                ),
                              ),
                            ],
                          ),
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

  Widget _buildMedia(BuildContext context, TwitModel twit) {
    if (twit.photos.isNotEmpty && twit.photos.first.photoUrl.isNotEmpty) {
      return _buildImage(context, twit.photos.first.photoUrl);
    } else if (twit.videos.isNotEmpty &&
        twit.videos.first.videoUrl.isNotEmpty) {
      log('BUYOGA KIRDDIIIIIIII');
      return _buildYouTubePlayer(twit.videos.first.videoUrl);
    } else {
      return const Center(
        child: Icon(Icons.broken_image, color: Colors.red, size: 50),
      );
    }
  }

  Widget _buildYouTubePlayer(String videoUrl) {
    log('Extracting video ID from: $videoUrl');
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);

    if (videoId == null) {
      log('Invalid video ID. Cannot load YouTube video.');
      return const Center(
        child: Text("Invalid YouTube URL"),
      );
    }

    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      ),
      showVideoProgressIndicator: true,
    );
  }

  Widget _buildImageWithLoader(TwitModel twitModel) {
    String imageUrl =
        'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg';

    if (twitModel.photos.isNotEmpty &&
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
          'assets/images/logo.png'); // Use a local fallback image
    }
  }
}
