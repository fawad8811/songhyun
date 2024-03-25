import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FooterContainer extends StatelessWidget {
  final bool isMainScreen;
  final bool isMobile;
  final int? pageIndex;

  const FooterContainer({
    Key? key,
    this.isMainScreen = false,
    this.isMobile = false,
    this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? buildMobileFooter(context)
        : buildDesktopFooter(context, isMainScreen);
  }

  Widget buildMobileFooter(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: getProportionateScreenWidth(60),
      // ),
      height: getProportionateScreenHeight(100),
      color: pageIndex == 0
          ? Colors.transparent.withOpacity(0.75)
          : AppColors.kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCopyrightText(context),
          ),
          const Spacer(),
          const LanguageButton(
            isMobile: true,
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
        ],
      ),
    );
  }

  Widget buildDesktopFooter(BuildContext context, bool isMainScreen) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      width: ResponsiveConfig.screenWidth,
      height: getProportionateScreenHeight(80),
      color: pageIndex == 0
          ? Colors.transparent.withOpacity(0.75)
          : AppColors.kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCopyrightText(context, isMainScreen),
          ),
          const Spacer(),
          buildLogoAndCompanyName(context, isMainScreen),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          const LanguageButton(),
        ],
      ),
    );
  }

  Widget buildCopyrightText(BuildContext context, [bool isMainScreen = false]) {
    return Expanded(
      child: Text(
        'COPYRIGHT (C) 2024 Choege Investment ALL RIGHTS RESERVED'
            .toUpperCase(),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: pageIndex == 0 ? AppColors.kWhite : AppColors.kBlack,
              fontSize: isMobile ? 6 : 12,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildLogoAndCompanyName(BuildContext context, bool isMainScreen) {
    return Row(
      children: [
        Image.asset(Assets.imagesChoegeLogoRemovebg, width: 100, height: 100),
        // const SizedBox(width: 10),
        // Text('companyName'.tr(),
        //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
        //         color: pageIndex == 0 ? AppColors.kWhite : AppColors.kBlack)),
      ],
    );
  }
}
