import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsScreen extends StatelessWidget {
  final bool isMobile;

  const NewsScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'News', image: Assets.imagesBgTopNews),
        SizedBox(height: getProportionateScreenHeight(20)),
        Container(
          color: AppColors.kMainBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 0 : getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsCard(
                    isMobile: isMobile,
                    image: Assets.imagesNews1,
                    title: AppLocalizations.of(context)!
                        .revenueAndOperatingIncome2015,
                    subTitle:
                        AppLocalizations.of(context)!.operatingIncome18bnWon),
                NewsCard(
                    isMobile: isMobile,
                    image: Assets.imagesNews2,
                    title: AppLocalizations.of(context)!
                        .revenueAndOperatingIncome2015,
                    subTitle:
                        AppLocalizations.of(context)!.operatingIncome18bnWon),
              ],
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(80)),
      ],
    );
  }
}

class NewsCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const NewsCard({
    super.key,
    required this.isMobile,
    required this.image,
    required this.title,
    this.subTitle = '',
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(8.0),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: isMobile ? 150 : 280,
            width: isMobile ? 150 : 280,
            child: Expanded(
              child: Image.asset(
                image,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.kGreen),
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 12,
                      ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset(Assets.imagesNewsFa),
                    const SizedBox(width: 8),
                    Image.asset(Assets.imagesNewstwr),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
