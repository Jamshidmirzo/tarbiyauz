// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';

class RegionsWidget extends StatelessWidget {
  final String text;
  const RegionsWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS_15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
