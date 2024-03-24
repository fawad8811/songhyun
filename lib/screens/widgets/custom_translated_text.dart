import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslatedText extends StatelessWidget {
  final String translationKey;
  final TextStyle? style;

  const TranslatedText(this.translationKey, {Key? key, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      translationKey.tr(),
      style: style,
    );
  }
}
