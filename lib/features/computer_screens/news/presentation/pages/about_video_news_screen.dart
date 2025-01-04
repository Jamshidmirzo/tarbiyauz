// ignore_for_file: prefer_const_constructors, avoid_web_libraries_in_flutter

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/core/colors/app_color.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';

class AboutVideoNewsScreen extends StatefulWidget {
  final String videoUrl;

  const AboutVideoNewsScreen({super.key, required this.videoUrl});

  @override
  _AboutVideoNewsScreenState createState() => _AboutVideoNewsScreenState();
}

class _AboutVideoNewsScreenState extends State<AboutVideoNewsScreen> {
  late String videoId;
  final ScrollController scrollController = ScrollController();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    videoId = _extractVideoId(widget.videoUrl);
    if (kIsWeb) {
      _registerIframe();
    }
  }

  String _extractVideoId(String url) {
    if (url.contains('youtube.com/watch?v=')) {
      return url.split('v=')[1];
    } else if (url.contains('youtu.be/')) {
      return url.split('/').last;
    }
    return '';
  }

  void _registerIframe() {
    if (kIsWeb) {
      final viewId = 'youtube-iframe-$videoId';
      ui.platformViewRegistry.registerViewFactory(
        viewId,
        (int viewId) {
          final iframe = html.IFrameElement()
            ..src = 'https://www.youtube.com/embed/$videoId'
            ..style.border = 'none'
            ..allowFullscreen = true;
          return iframe;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: isSmallScreen
          ? null
          : CustomAppBar(scrollController: scrollController, onPressed: () {}),
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: kIsWeb
                            ? _buildWebYouTubeEmbed()
                            : _buildMobileYouTubePlayer(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppDimens.PADDING_20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitleText(fontSize: 24),
                            const SizedBox(height: 16),
                            _buildDescriptionText(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        width: screenWidth * 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColor.blueColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(
                            AppDimens.BORDER_RADIUS_15,
                          ),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(
                                      AppDimens.BORDER_RADIUS_15)),
                              child: Image.network(
                                'https://via.placeholder.com/150',
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                'Short news description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!isSmallScreen)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Tavsiya Etamiz',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('News title $index'),
                          subtitle: Text('Short description $index'),
                          leading: const Icon(Icons.play_arrow),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDescriptionText({double fontSize = 16}) {
    return Text(
      '''Yopilib ketgan YouTube kanalimda Nasaf va OKMKning 2-davradagi yil oʻyini 2:0 hisobida yakuniga yetgach, tahlil qilgan edim. (Albatta, oʻyindan oldin ham fikrlar bildirgan edim.) Oʻshanda Oybek Rustamovni jamoa oʻyinini quruvchi; himoyadan toʻpni olib, birinchi pasni beruvchi ya'ni, hujumlarni qaysi qanotdan boshlanishini belgilab beruvchi vazifasini bajaruvchi sifatida bu mavsum harakat qilayotganini aytgan edim. Eng yomoni oxirgi yillarda bunday futbolchilar har bir klubda bor va buni payqab qolgan raqiblar Qahramonni boʻgʻib qoʻyadilar. Natijada jamoa oʻyini hech boʻlmaganda, bir taym chiqmay qoladi. OKMKning Nasafga qarshi oʻyinida xuddi shunday boʻlgan edi. Birinchi taymning oʻzida Nasaf oʻyin taqdiriga nuqtani qoʻygandi. Uyoğiga toʻpni chiroyli nazorat qilgan edi. Eng yaxshi vaqt choʻzish - bu toʻpni raqibga berib, "Xudo qoʻllamasa, Bizga gol urilmaydi" deya himoyada koʻndalang turib olmoqlik emas; toʻpni nazorat qilish, xolos. Xullas, yozsam, gap koʻp... Oʻsha tahlil Mening eng yaxshi tahlillarimdan boʻlgan edi. Koʻpchilik obunachilar maqtashgandi... Jamoasining muhim oʻyinchisi boʻlib, asosiy ishni qilib yurgan Oybek Rustamov OKMKni tark etib, Qoʻqonga ketibdi. Bu xabar Meni judayam xursand qildi. Oybek bu mavsum faoliyatidagi eng nurli davrini o'tqizdi. Qoʻqonning maqsadi tayin - bu mavsum Superligada qolmoqlik! Oxirgi oʻrinni olmasa, bas. Qolishi mumkin. Oxirgi oʻrinda Shoʻrtanni koʻrmoqdaman. \n\n@Anvarstern''',
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildWebYouTubeEmbed() {
    final viewId = 'youtube-iframe-$videoId';
    return HtmlElementView(viewType: viewId);
  }

  Widget _buildMobileYouTubePlayer() {
    return const Center(child: Text('Mobile YouTube Player'));
  }

  Widget _buildTitleText({double fontSize = 24}) {
    return Text(
      'Voluptate ex laboris labore nostrud occaecat excepteur cillum nulla.',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildExpandableDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded
              ? '''Full text description goes here...'''
              : '''Short preview description...''',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
