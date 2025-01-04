import 'package:flutter/material.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';

class SearchResultScreen extends StatelessWidget {
  SearchResultScreen({super.key});
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    return Scaffold(
      appBar: isSmallScreen
          ? null
          : CustomAppBar(scrollController: scrollController, onPressed: () {}),
    );
  }
}
