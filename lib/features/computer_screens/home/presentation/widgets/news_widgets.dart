// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';

class NewsWidgets extends StatelessWidget {
  final TwitModel twitModel;
  const NewsWidgets({
    Key? key,
    required this.twitModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(twitModel.photos.first.photoUrl);
    return ZoomTapAnimation(
      onTap: () {
        context.go(Routes.aboutNewsScreen);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Ab
        // outVideoNewsScreen(
        //           videoUrl: 'https://youtu.be/pvzvbFKDoQY'),
        //     ));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimens.BORDER_RADIUS_15),
                ),
                child: Image.network(
                  (twitModel.photos.isNotEmpty &&
                          twitModel.photos.first.photoUrl.isNotEmpty)
                      ? twitModel.photos.first.photoUrl
                      : 'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg',
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppDimens.PADDING_8),
                child: Text(
                  twitModel.texts,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
