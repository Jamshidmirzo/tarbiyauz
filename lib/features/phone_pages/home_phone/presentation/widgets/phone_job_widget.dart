// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/core/widgets/get_date_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_news_screen.dart';

class PhoneJobWidget extends StatelessWidget {
  final TwitModel twitModel;
  // ignore: use_super_parameters
  const PhoneJobWidget({
    Key? key,
    required this.twitModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        context.go('${Routes.aboutNewsScreen}/${twitModel.id}');
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_10),
        ),
        padding: const EdgeInsets.all(AppDimens.PADDING_10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    twitModel.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.hs(),
                  GetDateWidget(type: twitModel.createdAt)
                ],
              ),
            ),
            8.hs(),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_10),
                child: Image.network(
                  twitModel.photos.first.photoUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
