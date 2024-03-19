import 'package:flutter/material.dart';
import 'package:songhyun/generated/assets.dart';
import 'package:songhyun/home/components/footer_continer.dart';
import 'package:songhyun/home/components/home_text_widget.dart';
import 'package:songhyun/size_config.dart';
import 'package:songhyun/theme/app_colors.dart';

class WebBody extends StatelessWidget {
  const WebBody({Key? key}) : super(key: key);

  static final Map<String, List<String>> submenuItems = {
    'OVERVIEW': ['Greeting', 'Vision', 'History', 'Team'],
    'INVESTMENT': ['Philosophy', 'Strategy', 'Fund'],
    'PORTFOLIO': [],
    'NEWS': [],
    'CONTACT': [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://cdn.pixabay.com/photo/2017/08/30/07/56/money-2696229_1280.jpg',
            fit: BoxFit.cover,
          ),
          // Image.asset(
          //   Assets.imagesHomeBackgroundPng, // Replace with your image path
          //   fit: BoxFit.cover,
          // ),
          // Column for the content
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // AppBar
              AppBar(
                toolbarHeight: getProportionateScreenHeight(120),
                backgroundColor: Colors.transparent.withOpacity(0.5),
                elevation: 0,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(60),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Assets.imagesOnlyLogo, width: 70, height: 70),
                        const SizedBox(width: 20),
                        const Text(
                          'Choege Investment\n Private Limited',
                          style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ...submenuItems.keys.take(2).map((title) {
                    return _buildSubMenuButton(title, context);
                  }).toList(),
                  for (int i = 2; i < submenuItems.length; i++)
                    _buildRegularButton(
                        submenuItems.keys.elementAt(i), context),
                ],
              ),
              // Body Content
              const HomeTextWidget(),
              const FooterContiner(
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubMenuButton(String title, BuildContext context) {
    return _buildAppBarButton(title, context, true);
  }

  Widget _buildRegularButton(String title, BuildContext context) {
    return _buildAppBarButton(title, context, false);
  }

  PopupMenuButton<String> _buildAppBarButton(
      String title, BuildContext context, bool isSubMenu) {
    return PopupMenuButton<String>(
      tooltip: '',
      color: isSubMenu ? Colors.transparent.withOpacity(0.2) : null,
      itemBuilder: (context) {
        return submenuItems[title]!.map((item) {
          return PopupMenuItem<String>(
            height: 30,
            value: item,
            child: Text(
              item.toUpperCase(),
              style: const TextStyle(
                color: AppColors.kWhite,
                fontSize: 14,
              ),
            ),
          );
        }).toList();
      },
      onSelected: (value) {
        ///
        ///
        ///
      },
      // Position the submenu at the bottom of the AppBar button
      offset: const Offset(0, 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: AppColors.kWhite),
        ),
      ),
    );
  }
}

class LanguageButton extends StatefulWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  LanguageButtonState createState() => LanguageButtonState();
}

class LanguageButtonState extends State<LanguageButton> {
  bool _isKorean = false;

  @override
  Widget build(BuildContext context) {
    String buttonText = _isKorean ? 'korean' : 'ENGLISH';
    return TextButton(
      onPressed: _toggleLanguage,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFababa8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.language,
            color: AppColors.kBlack,
          ),
          const SizedBox(width: 10.0),
          Text(
            buttonText.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  void _toggleLanguage() {
    setState(() {
      _isKorean = !_isKorean;
    });
  }
}
