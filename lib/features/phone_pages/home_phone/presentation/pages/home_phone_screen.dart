import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/appbar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/main_news_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';

// ignore: must_be_immutable
class HomePhoneScreen extends StatefulWidget {
  const HomePhoneScreen({super.key});

  @override
  State<HomePhoneScreen> createState() => _HomePhoneScreenState();
}

class _HomePhoneScreenState extends State<HomePhoneScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetAllTwitesEvent());
  }

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
          // const SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(AppDimens.PADDING_20),
          //     child: MainNewsPhoneWidget(),
          //   ),
          // ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.status == Status.Loading) {
                return const SliverToBoxAdapter(
                  child: LoadingWidget(),
                );
              }

              if (state.status == Status.Error) {
                return const SliverToBoxAdapter(
                  child: CustomErrorWidget(),
                );
              }

              if (state.status == Status.Success) {
                final twites = state.twites ?? [];

                if (twites.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('No tweets available.')),
                  );
                }

                return SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.PADDING_20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: twites.length, (context, index) {
                        return PhoneJobWidget(
                          twitModel: twites[index],
                        );
                      }),
                    ));
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
