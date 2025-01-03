import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';

class BottomSheetForLang extends StatefulWidget {
  const BottomSheetForLang({super.key});

  @override
  State<BottomSheetForLang> createState() => _BottomSheetForLangState();
}

class _BottomSheetForLangState extends State<BottomSheetForLang> {
  String _selectedLanguage = 'Uzbek';

  final List<String> _languages = ['Uzbek', 'Russian'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.PADDING_20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimens.BORDER_RADIUS_20)),
      ),
      child: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          return RadioListTile(
            title: Text(
              _languages[index],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            value: _languages[index],
            groupValue: _selectedLanguage,
            activeColor: Colors.black,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          );
        },
      ),
    );
  }
}
