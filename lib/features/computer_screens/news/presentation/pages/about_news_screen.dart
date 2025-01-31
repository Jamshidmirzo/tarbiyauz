import 'package:flutter/material.dart';
import 'package:tarbiyauz/core/constants/app_dimens.dart';
import 'package:tarbiyauz/core/extension/extensions.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/appbar_widget.dart';
import 'package:tarbiyauz/features/computer_screens/home/presentation/widgets/last_news_widget.dart';
import 'package:tarbiyauz/features/phone_pages/home_phone/presentation/widgets/phone_job_widget.dart';
import 'package:tarbiyauz/core/colors/app_color.dart';

class AboutNewsScreen extends StatefulWidget {
  AboutNewsScreen({super.key});

  @override
  State<AboutNewsScreen> createState() => _AboutNewsScreenState();
}

class _AboutNewsScreenState extends State<AboutNewsScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: isSmallScreen
          ? null
          : CustomAppBar(scrollController: scrollController, onPressed: () {}),
      body: isSmallScreen
          ? _buildSmallScreenLayout(context)
          : _buildLargeScreenLayout(context),
    );
  }

  Widget _buildSmallScreenLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.07,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText(),
                const SizedBox(height: 16),
                _buildDescriptionText(),
                const SizedBox(height: 16),
                _buildImage(context),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) {
                return const PhoneJobWidget();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLargeScreenLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print(Theme.of(context).brightness);

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleText(fontSize: 30),
                      const SizedBox(height: 16),
                      _buildDescriptionText(fontSize: 18),
                      const SizedBox(height: 16),
                      _buildImage(context),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: screenHeight * 0.5,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.02,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // return NewsWidgets();
                      return Container(
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
                                      AppDimens.BORDER_RADIUS_15),
                                  bottom: Radius.circular(
                                    AppDimens.BORDER_RADIUS_15,
                                  )),
                              child: Image.network(
                                'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                              ),
                            ),
                            20.hs(),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Tempor elit sunt est minim exercitation commodo officia id commodo ad sint enim laboris.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: screenHeight * 0.1,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tavsiya Etamiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const LastNewsWidget(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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

  Widget _buildDescriptionText({double fontSize = 16}) {
    return Text(
      '''Yopilib ketgan YouTube kanalimda Nasaf va OKMKning 2-davradagi yil oʻyini 2:0 hisobida yakuniga yetgach, tahlil qilgan edim. (Albatta, oʻyindan oldin ham fikrlar bildirgan edim.) Oʻshanda Oybek Rustamovni jamoa oʻyinini quruvchi; himoyadan toʻpni olib, birinchi pasni beruvchi ya'ni, hujumlarni qaysi qanotdan boshlanishini belgilab beruvchi vazifasini bajaruvchi sifatida bu mavsum harakat qilayotganini aytgan edim. Eng yomoni oxirgi yillarda bunday futbolchilar har bir klubda bor va buni payqab qolgan raqiblar Qahramonni boʻgʻib qoʻyadilar. Natijada jamoa oʻyini hech boʻlmaganda, bir taym chiqmay qoladi. OKMKning Nasafga qarshi oʻyinida xuddi shunday boʻlgan edi. Birinchi taymning oʻzida Nasaf oʻyin taqdiriga nuqtani qoʻygandi. Uyoğiga toʻpni chiroyli nazorat qilgan edi. Eng yaxshi vaqt choʻzish - bu toʻpni raqibga berib, "Xudo qoʻllamasa, Bizga gol urilmaydi" deya himoyada koʻndalang turib olmoqlik emas; toʻpni nazorat qilish, xolos. Xullas, yozsam, gap koʻp... Oʻsha tahlil Mening eng yaxshi tahlillarimdan boʻlgan edi. Koʻpchilik obunachilar maqtashgandi... Jamoasining muhim oʻyinchisi boʻlib, asosiy ishni qilib yurgan Oybek Rustamov OKMKni tark etib, Qoʻqonga ketibdi. Bu xabar Meni judayam xursand qildi. Oybek bu mavsum faoliyatidagi eng nurli davrini o'tqizdi. Qoʻqonning maqsadi tayin - bu mavsum Superligada qolmoqlik! Oxirgi oʻrinni olmasa, bas. Qolishi mumkin. Oxirgi oʻrinda Shoʻrtanni koʻrmoqdaman. \n\n@Anvarstern''',
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimens.BORDER_RADIUS_15),
          bottom: Radius.circular(
            AppDimens.BORDER_RADIUS_15,
          )),
      child: Image.network(
        'https://yuz.uz/imageproxy/1200x/https://yuz.uz/file/news/c1804423a548ba949fb7d6d0873aba87.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.8,
      ),
    );
  }
}
