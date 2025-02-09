import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/bottom_sheet_for_lang.dart';

class AppbarPhoneWidget extends StatefulWidget {
  final ScrollController scrollController;
  const AppbarPhoneWidget({
    super.key,
    required this.scrollController,
  });

  @override
  State<AppbarPhoneWidget> createState() => _AppbarPhoneWidgetState();
}

class _AppbarPhoneWidgetState extends State<AppbarPhoneWidget> {
  late ValueNotifier<Color> _appBarBackgroundColor;
  bool _isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _appBarBackgroundColor = ValueNotifier<Color>(Colors.transparent);
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    _appBarBackgroundColor.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset > 50) {
      _appBarBackgroundColor.value =
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white;
    } else {
      _appBarBackgroundColor.value = Colors.transparent;
    }
  }

  openBottomForLang(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const BottomSheetForLang());
  }

  openBottomForSearch(BuildContext context) {
    setState(() {
      _isSearchExpanded = !_isSearchExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.015;

    return ValueListenableBuilder<Color>(
      valueListenable: _appBarBackgroundColor,
      builder: (context, color, child) {
        return SliverAppBar(
          backgroundColor: color,
          pinned: true,
          leading: ZoomTapAnimation(
            onTap: () {
              widget.scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Image.asset(
              'assets/images/logo.png',
              height: fontSize * 2,
            ),
          ),
          title: _isSearchExpanded
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(GetBySearchTwitesEvent(
                              title: _searchController.text));
                          context.go(Routes.searchResult);
                        },
                        icon: Icon(Icons.search, color: Colors.grey[600]),
                      ),
                      Expanded(
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            context.read<HomeBloc>().add(GetBySearchTwitesEvent(
                                title: _searchController.text));
                            context.go(Routes.searchResult);
                          },
                          controller: _searchController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
          actions: [
            if (!_isSearchExpanded)
              IconButton(
                onPressed: () {
                  openBottomForSearch(context);
                },
                icon: Image.asset(
                  'assets/icons/search_icon.png',
                  width: 24,
                  height: 24,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            10.ws(),
          ],
        );
      },
    );
  }
}
