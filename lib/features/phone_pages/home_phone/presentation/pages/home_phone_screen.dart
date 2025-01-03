import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/appbar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/main_news_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';

// ignore: must_be_immutable
class HomePhoneScreen extends StatelessWidget {
  HomePhoneScreen({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: isDarkMode ? Colors.red.shade400 : Colors.grey[200],
              height: 20,
              child: Marquee(
                text: 'Site test rejimida ishlamoqda',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                scrollAxis: Axis.horizontal,
                blankSpace: 50.0,
                velocity: 50.0,
              ),
            ),
          ),
          AppbarPhoneWidget(scrollController: _scrollController),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppDimens.PADDING_20),
              child: MainNewsPhoneWidget(),
            ),
          ),
          SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(childCount: 20,
                    (context, index) {
                  return const PhoneJobWidget();
                }),
              )),
        ],
      ),
    );
  }
}
