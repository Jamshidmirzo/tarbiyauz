// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/currency/presentation/blocs/bloc/converter_bloc.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/drawer_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/is_computer_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  void _toggleDrawer() {
    print('234r5t6yuiuytrewq  ');
    context
        .read<ConverterBloc>()
        .add(const ConverterEvent.getNotNullCurrency());
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void initState() {
    super.initState();
    context.read<ConverterBloc>().add(const ConverterEvent.getCurrency());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF121212),
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      appBar: CustomAppBar(
        scrollController: _scrollController,
        onPressed: _toggleDrawer,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.PADDING_20,
              left: AppDimens.PADDING_20,
              right: AppDimens.PADDING_20,
            ),
            child: IsComputerWidget(scrollController: _scrollController),
          ),
          // Uncomment if needed
          // AnimatedContaierWidget(
          //   isDrawerOpen: _isDrawerOpen,
          //   toggleDrawer: _toggleDrawer,
          // ),
        ],
      ),
    );
  }
}
