// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/appbar_phone_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/bottom_sheet_for_lang.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/bottom_sheet_for_mode.dart';
import 'package:tarbiyauz/features/phone_pages/more_phone/presentation/widgets/categories_widget.dart';
import 'package:tarbiyauz/features/phone_pages/more_phone/presentation/widgets/settings_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePhoneScreen extends StatelessWidget {
  MorePhoneScreen({super.key});
  final ScrollController _scrollController = ScrollController();
  final List categories = [
    'O\'zbekiston',
    'Jahon',
    'Iqtisodiyot',
    'Jamiyat',
    'Sport',
    'Fan-texnika',
    'Nuqtai nazar',
    'Audio'
  ];
  final List settings = ['Ilova tili', 'Ilova holati', 'Bog`lanish'];

  List<String> viloyatlar = [
    'Andijon',
    'Buxoro',
    'Fargʻona',
    'Jizzax',
    'Qashqadaryo',
    'Navoiy',
    'Namangan',
    'Samarqand',
    'Sirdaryo',
    'Surxondaryo',
    'Toshkent',
    'Xorazm',
    'Qoraqalpogʻiston Respublikasi'
  ];
  openBottomForLang(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const BottomSheetForLang());
  }

  openBottomForMode(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const BottomSheetForMode());
  }

  connect(BuildContext context) async {
    if (await canLaunchUrl(Uri.parse('https://t.me/harbiytarbiya_bot'))) {
      await launchUrl(Uri.parse('https://t.me/harbiytarbiya_bot'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch Telegram'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List icons = [
      Icons.language,
      AdaptiveTheme.of(context).theme == ThemeData.dark()
          ? Icons.light_mode
          : Icons.dark_mode,
      Icons.call
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.PADDING_20),
        child: CustomScrollView(
          slivers: [
            AppbarPhoneWidget(scrollController: _scrollController),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CategoriesWidget(text: categories[index]);
                },
                childCount: categories.length,
              ),
            ),
            SliverToBoxAdapter(
              child: 20.hs(),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Sozlamalar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SliverToBoxAdapter(
              child: 10.hs(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: settings.length, (context, index) {
              return SettingsWidget(
                onTap: () {
                  if (index == 0) {
                    openBottomForLang(context);
                  }
                  if (index == 1) {
                    openBottomForMode(context);
                  }
                  if (index == 2) {
                    connect(context);
                  }
                },
                text: settings[index],
                icon: icons[index],
              );
            })),
          ],
        ),
      ),
    );
  }
}

// const SliverToBoxAdapter(
//   child: Text(
//     "Hudular boyicha",
//     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//   ),
// ),
// SliverToBoxAdapter(
//   child: 20.hs(),
// ),
// SliverGrid(
//   delegate: SliverChildBuilderDelegate(
//       childCount: viloyatlar.length, (context, index) {
//     return RegionsWidget(text: viloyatlar[index]);
//   }),
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       childAspectRatio: 3.5,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10),
// ),
