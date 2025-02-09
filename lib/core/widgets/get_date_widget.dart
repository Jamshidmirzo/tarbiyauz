// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetDateWidget extends StatelessWidget {
  final String type;
  const GetDateWidget({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('dd.MM.yyyy')
          .format(DateTime.parse(type.split(' ').sublist(0, 2).join(' '))),
    );
  }
}
