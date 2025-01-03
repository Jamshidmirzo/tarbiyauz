import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';

class MainNewsPhoneWidget extends StatelessWidget {
  const MainNewsPhoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.015;

    return Column(
      children: [
        Text(
          'Minim occaecat consequat commodo dolor anim labore reprehenderit do ut. Esse id eiusmod ea esse est ut. Cupidatat cillum adipisicing.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize * 2,
          ),
        ),
        10.hs(),
        Text(
          'Minim occaecat consequat commodo dolor anim labore reprehenderit do ut. Esse id eiusmod ea esse est ut. Cupidatat cillum adipisicing amet officia nostrud culpa eu ut culpa magna Lorem veniam sunt amet.',
          style: TextStyle(fontSize: fontSize * 1),
        ),
        20.hs(),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.3,
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
                  child: const Center(child: Icon(Icons.error)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
