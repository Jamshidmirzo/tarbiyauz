// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/features/computer_screens/home/data/model/twit_model.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/last_news_widget.dart';

class ListViewWidgets extends StatelessWidget {
  final ScrollController scrollController;
  final List<TwitModel> twites;
  const ListViewWidgets({
    Key? key,
    required this.scrollController,
    required this.twites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.PADDING_8),
            child: Text(
              'So`ngi yangiliklar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.015 * 1.2,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => LastNewsWidget(
              twitModel: twites[index],
            ),
            childCount: twites.length,
          ),
        ),
      ],
    );
  }
}
