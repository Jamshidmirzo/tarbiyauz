// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/news_widgets.dart';

class GridViewWidgets extends StatelessWidget {
  final ScrollController scrollController;
  const GridViewWidgets({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) =>  Container(),
            childCount: 26,
          ),
        ),
      ],
    );
  }
}
