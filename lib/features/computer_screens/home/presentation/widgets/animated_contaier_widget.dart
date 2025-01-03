// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedContaierWidget extends StatelessWidget {
  final bool isDrawerOpen;
  final Function toggleDrawer;
  const AnimatedContaierWidget({
    super.key,
    required this.isDrawerOpen,
    required this.toggleDrawer,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: isDrawerOpen ? 0 : -300,
      left: 0,
      right: 0,
      child: Container(
        height: 300,
        color: Colors.blue,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                toggleDrawer();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                toggleDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
