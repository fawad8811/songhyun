import 'package:flutter/material.dart';
import 'package:songhyun/screens/home/components/custom_app_bar.dart';
import 'package:songhyun/screens/home/components/footer_container.dart';
import 'package:songhyun/screens/home/components/home_text_widget.dart';
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
          Image.network(
            'https://cdn.pixabay.com/photo/2017/08/30/07/56/money-2696229_1280.jpg',
            fit: BoxFit.cover,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(),
              HomeTextWidget(),
              FooterContainer(isMainScreen: true,),
            ],
          ),
        ],
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
