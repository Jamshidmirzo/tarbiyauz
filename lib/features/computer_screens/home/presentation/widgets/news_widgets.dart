// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';

class NewsWidgets extends StatelessWidget {
  final TwitModel twitModel;
  // ignore: use_super_parameters
  const NewsWidgets({Key? key, required this.twitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('${twitModel.title} - ${twitModel.readersCount}');
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ZoomTapAnimation(
        onTap: () => context.go('${Routes.aboutNewsScreen}/${twitModel.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_15),
          child: Stack(
            children: [
              _buildImageWithLoader(),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppDimens.BORDER_RADIUS_15),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),

              // Glassmorphism Overlay with BackdropFilter
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        twitModel.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),

                      // Description
                      Text(
                        twitModel.texts,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Handles Image Loading with Lottie
  Widget _buildImageWithLoader() {
    final imageUrl = _getImageUrl();
    debugPrint("Final imageUrl: $imageUrl");

    return FutureBuilder(
      future: _preloadImage(imageUrl),
      builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: 80,
              height: 80,
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.grey,
            child: const Center(child: Icon(Icons.error, size: 40)),
          );
        } else {
          return Image(
            image: snapshot.data!,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }

  /// Determines the correct image URL
  String _getImageUrl() {
    if (twitModel.photos.isNotEmpty &&
        twitModel.photos.first.photoUrl.isNotEmpty) {
      return twitModel.photos.first.photoUrl;
    }

    if (twitModel.videos.isNotEmpty) {
      final videoUrl = twitModel.videos.first.videoUrl;
      final videoId = _extractYouTubeVideoId(videoUrl);
      debugPrint("Extracted Video ID: $videoId");

      if (videoId != null) {
        return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
      }
    }

    return 'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg';
  }

  /// Extracts the YouTube Video ID from URL
  String? _extractYouTubeVideoId(String url) {
    try {
      final uri = Uri.parse(url);
      String? videoId;

      if (uri.host.contains("youtu.be")) {
        videoId = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : null;
      } else if (uri.host.contains("youtube.com")) {
        videoId = uri.queryParameters["v"];
      }

      debugPrint("Extracted videoId: $videoId from URL: $url");
      return videoId;
    } catch (e) {
      debugPrint("Error extracting videoId: $e");
      return null;
    }
  }

  /// Preloads Image to avoid flickering
  Future<ImageProvider> _preloadImage(String url) async {
    final image = NetworkImage(url);
    final completer = Completer<void>();
    final listener = ImageStreamListener((_, __) => completer.complete(),
        onError: (error, stackTrace) {
      debugPrint("Image load error: $error");
      completer.completeError(error);
    });

    image.resolve(const ImageConfiguration()).addListener(listener);
    await completer.future;
    return image;
  }
}
