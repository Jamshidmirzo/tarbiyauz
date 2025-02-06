// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';

class LastNewsWidget extends StatelessWidget {
  final TwitModel twitModel;
  // ignore: use_super_parameters
  const LastNewsWidget({
    Key? key,
    required this.twitModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.PADDING_8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(twitModel.title),
          const Divider(),
        ],
      ),
    );
  }
}
