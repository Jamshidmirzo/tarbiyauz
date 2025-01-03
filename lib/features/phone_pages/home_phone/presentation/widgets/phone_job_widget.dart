import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/features/computer_screens/news/presentation/pages/about_news_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PhoneJobWidget extends StatelessWidget {
  const PhoneJobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AboutNewsScreen(),
            ));
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
                  const Text(
                    "Exercitation minim commodo veniam voluptate occaecat elit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.hs(),
                  Text(
                    '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
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
                  'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg',
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
