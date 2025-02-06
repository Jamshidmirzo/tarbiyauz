// ignore_for_file: use_build_context_synchronously

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  Future<void> connect(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
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
    final isDarkMode = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return Drawer(
      child: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            trailing: Switch(
              activeTrackColor: Colors.green,
              activeColor: Colors.white,
              value: isDarkMode,
              onChanged: (value) {
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                } else {
                  AdaptiveTheme.of(context).setLight();
                }
              },
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              connect(context, 'https://t.me/harbiytarbiya_bot');
            },
            child: const ListTile(
              leading: Icon(Icons.call),
              title: Text('Bog`lanish'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
          
        ],
      ),
    );
  }
}
