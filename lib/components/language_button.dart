import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:songhyun/providers/language_provider.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isKorean = languageProvider.locale.languageCode == 'ko';

    return TextButton(
      onPressed: () {
        final newLocale =
            isKorean ? const Locale('en', 'US') : const Locale('ko', 'KR');
        languageProvider.setLocale(newLocale);
      },
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFababa8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.language,
            color: Colors.black,
          ),
          const SizedBox(width: 10.0),
          Text(
            isKorean ? 'ENGLISH' : 'KOREAN',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
