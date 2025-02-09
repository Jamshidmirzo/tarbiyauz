import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarbiyauz/core/routes/routes.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/bloc/bloc/home_bloc.dart';

class AppBarPhoneWidgetReal extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarPhoneWidgetReal({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarPhoneWidgetReal> createState() => _AppBarPhoneWidgetRealState();
}

class _AppBarPhoneWidgetRealState extends State<AppBarPhoneWidgetReal> {
  bool _isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      centerTitle: true,
      title: _isSearchExpanded ? _buildSearchBar() : null,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isSearchExpanded = !_isSearchExpanded;
              if (!_isSearchExpanded) _searchController.clear();
            });
          },
          icon: Icon(_isSearchExpanded ? Icons.close : Icons.search),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      'assets/images/logo.png',
      height: 40,
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
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
              context
                  .read<HomeBloc>()
                  .add(GetBySearchTwitesEvent(title: _searchController.text));
              context.go(Routes.searchResult);
            },
            icon: Icon(Icons.search, color: Colors.grey[600]),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: _searchController,
              onFieldSubmitted: (value) {
                context
                    .read<HomeBloc>()
                    .add(GetBySearchTwitesEvent(title: _searchController.text));
                context.go(Routes.searchResult);
              },
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
