import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';

class BottomSheetForSearch extends StatelessWidget {
  const BottomSheetForSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.PADDING_20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      child: const Column(
        children: [],
      ),
    );
  }
}
