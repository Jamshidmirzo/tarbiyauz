import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomSheetForMode extends StatefulWidget {
  const BottomSheetForMode({super.key});

  @override
  State<BottomSheetForMode> createState() => _BottomSheetForModeState();
}

class _BottomSheetForModeState extends State<BottomSheetForMode> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setSystem();
            },
            child: ListTile(
              trailing:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.system
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
              leading: const Icon(CupertinoIcons.device_phone_portrait),
              title: const Text(
                'Like a Syestem',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setLight();
            },
            child: ListTile(
              trailing:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
              leading: const Icon(Icons.light_mode),
              title: const Text(
                'Light mode',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: () {
              setState(() {});
              Navigator.pop(context);
              AdaptiveTheme.of(context).setDark();
            },
            child: ListTile(
              trailing: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                  ? Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    )
                  : null,
              leading: const Icon(Icons.dark_mode),
              title: const Text(
                'Dark mode',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
