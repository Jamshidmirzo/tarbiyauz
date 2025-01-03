import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';

class NewsPhoneScreen extends StatefulWidget {
  const NewsPhoneScreen({super.key});

  @override
  State<NewsPhoneScreen> createState() => _NewsPhoneScreenState();
}

class _NewsPhoneScreenState extends State<NewsPhoneScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
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
  @override
  void initState() {
    super.initState();
    controller = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("So`ngi yangiliklar"),
        bottom: TabBar(isScrollable: true, controller: controller, tabs: [
          for (int i = 0; i < categories.length; i++)
            Tab(
              text: categories[i],
            )
        ]),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppDimens.PADDING_20),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: const Text(
                    'Minim do laborum sit ipsum excepteur sunt do pariatur consectetur commodo ex ad cillum deserunt.'),
                subtitle: Text(
                    '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}'),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
