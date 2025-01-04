// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marquee/marquee.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final void Function()? onPressed;

  const CustomAppBar({
    super.key,
    required this.scrollController,
    required this.onPressed,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(120);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedLanguage = 'O\'zbekcha';
  List<String> languages = [
    'O\'zbekcha',
    'Русский',
  ];

  final List<String> categories = [
    'O\'zbekiston',
    'Jahon',
    'Iqtisodiyot',
    'Jamiyat',
    'Sport',
    'Fan-texnika',
    'Nuqtai nazar',
    'Audio'
  ];

  bool _isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  double get fontSize => MediaQuery.of(context).size.width * 0.015;

  @override
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: isDarkMode ? Colors.red.shade400 : Colors.grey[200],
          height: 40,
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
        20.hs(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 9),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogo(),
                _isSearchExpanded ? _buildSearchBar() : _buildCategories(),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        ZoomTapAnimation(
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
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildCategories() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((category) {
          return Flexible(
            child: ZoomTapAnimation(
              onTap: () {},
              child: Text(category, style: TextStyle(fontSize: fontSize)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearchExpanded = !_isSearchExpanded;
            });
          },
          icon: Icon(_isSearchExpanded ? Icons.close : Icons.search),
        ),
        IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {},
        ),
        _buildLanguageDropdown(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.grey[600])),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                onFieldSubmitted: (value) {
                  context.go(Routes.searchResult);
                },
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return ZoomTapAnimation(
      onTap: null,
      child: DropdownButton<String>(
        value: selectedLanguage,
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        items: languages.map((language) {
          return DropdownMenuItem(
            value: language,
            child: Text(language, style: const TextStyle(fontSize: 16)),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedLanguage = value!;
          });
        },
        dropdownColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
      ),
    );
  }
}
