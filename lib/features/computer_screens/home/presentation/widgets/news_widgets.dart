// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NewsWidgets extends StatelessWidget {
  final TwitModel twitModel;
  const NewsWidgets({Key? key, required this.twitModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${twitModel.title}- ${twitModel.readersCount}');
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

                      // Views Counter
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
    return FutureBuilder(
      future: _preloadImage(twitModel.photos.isNotEmpty &&
              twitModel.photos.first.photoUrl.isNotEmpty
          ? twitModel.photos.first.photoUrl
          : 'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg'),
      builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading.json', // Lottie animation while loading
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

  /// Preloads Image to avoid flickering
  Future<ImageProvider> _preloadImage(String url) async {
    final image = NetworkImage(url);
    final completer = Completer<void>();
    final listener = ImageStreamListener((_, __) => completer.complete());
    image.resolve(const ImageConfiguration()).addListener(listener);
    await completer.future;
    return image;
  }
}
