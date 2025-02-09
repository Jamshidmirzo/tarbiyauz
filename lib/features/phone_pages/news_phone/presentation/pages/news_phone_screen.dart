import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarbiyauz/core/constants/app_constants.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/core/widgets/error_widget.dart';
import 'package:tarbiyauz/core/widgets/get_date_widget.dart';
import 'package:tarbiyauz/core/widgets/loading_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';

class NewsPhoneScreen extends StatefulWidget {
  const NewsPhoneScreen({Key? key}) : super(key: key);

  @override
  State<NewsPhoneScreen> createState() => _NewsPhoneScreenState();
}

class _NewsPhoneScreenState extends State<NewsPhoneScreen>
    with TickerProviderStateMixin {
  TabController? controller;
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetTypesEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (categories.isNotEmpty) {
        context
            .read<HomeBloc>()
            .add(GetByTypeTwitesEvent(type: categories.first));
      }
    });

    controller = TabController(length: 0, vsync: this);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void updateTabs(List<String> newCategories) {
    if (categories.isNotEmpty && listEquals(categories, newCategories)) {
      return; // Если категории не изменились, выходим
    }

    setState(() {
      categories = newCategories;
      controller?.dispose();
      controller = TabController(length: categories.length, vsync: this);

      if (categories.isNotEmpty) {
        context
            .read<HomeBloc>()
            .add(GetByTypeTwitesEvent(type: categories.first));
      }

      controller!.addListener(() {
        if (controller!.index >= 0 &&
            controller!.index < categories.length &&
            controller!.indexIsChanging == false) {
          final selectedType = categories[controller!.index];
          log('Загрузка данных для: $selectedType');
          context
              .read<HomeBloc>()
              .add(GetByTypeTwitesEvent(type: selectedType));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        log(state.toString());
        if (state.status == Status.Success) {
          final types = state.types ?? [];
          ;
          log("Полученные категории: $types");
          updateTabs(types);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("So‘ngi yangiliklar"),
          bottom: categories.isNotEmpty
              ? TabBar(
                  isScrollable: true,
                  controller: controller,
                  tabs: categories.map((e) => Tab(text: e)).toList(),
                )
              : null,
        ),
        body: categories.isEmpty
            ? const LoadingWidget()
            : TabBarView(
                controller: controller,
                children: categories.map((category) {
                  return BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.status == Status.Loading) {
                        return const LoadingWidget();
                      }

                      if (state.status == Status.Error) {
                        return const CustomErrorWidget();
                      }
                      if (state.status == Status.Success) {
                        final tiwites = state.typesTwites ?? [];
                        return ListView.builder(
                          padding: const EdgeInsets.all(AppDimens.PADDING_20),
                          itemCount: tiwites.length,
                          itemBuilder: (context, index) {
                            final type = tiwites[index];
                            log(type.createdAt);
                            return GestureDetector(
                              onTap: () {
                                context
                                    .go('${Routes.aboutNewsScreen}/${type.id}');
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                      title: Text(type.title),
                                      subtitle:
                                          GetDateWidget(type: type.createdAt)),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  );
                }).toList(),
              ),
      ),
    );
  }
}
