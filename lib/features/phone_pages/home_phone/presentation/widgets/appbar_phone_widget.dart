import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/bottom_sheet_for_lang.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/bottom_sheet_for_search.dart';

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
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => const BottomSheetForSearch());
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.015;

    return ValueListenableBuilder<Color>(
      valueListenable: _appBarBackgroundColor,
      builder: (context, color, child) {
        return SliverAppBar(
          backgroundColor: color,
          actions: [
            ZoomTapAnimation(
              onTap: () {
                openBottomForLang(context);
              },
              child: const Text(
                'O`zbekcha',
              ),
            ),
            const Icon(Icons.arrow_drop_down_rounded),
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
        );
      },
    );
  }
}
