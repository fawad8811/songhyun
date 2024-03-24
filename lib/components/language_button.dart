import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:songhyun/theme/app_colors.dart';

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
      context.setLocale(const Locale('ko', 'KR'));
    });
  }
}
