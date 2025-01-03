// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/last_news_widget.dart';

class ListViewWidgets extends StatelessWidget {
  final ScrollController scrollController;
  const ListViewWidgets({
    super.key,
    required this.scrollController,
  });

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
            (context, index) => const LastNewsWidget(),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
