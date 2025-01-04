import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NewsWidgets extends StatelessWidget {
  const NewsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppDimens.PADDING_8),
                child: Text(
                  'Mollit irure nulla ut incididunt occaecat eu ullamco sit. Cillum amet cillum aliqua ad sunt commodo laborum occaecat in anim sit tempor labore sit.',
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
