import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';

class LastNewsWidget extends StatelessWidget {
  const LastNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppDimens.PADDING_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ullamco nostrud id occaecat sunt culpa nostrud irure eu anim sit mollit aute. Proident sit elit est deserunt culpa cupidatat Lorem exercitation labore tempor ad consectetur.",
          ),
          Divider(),
        ],
      ),
    );
  }
}
