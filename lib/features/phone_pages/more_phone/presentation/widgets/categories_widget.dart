// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tarbiyauz/core/constants/app_colors.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';

class CategoriesWidget extends StatelessWidget {
  final String text;
  const CategoriesWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppDimens.PADDING_10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppDimens.BORDER_RADIUS_10,
            ),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.c1C1C1E
                : Colors.white,
          ),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
        ),
        10.hs(),
      ],
    );
  }
}
