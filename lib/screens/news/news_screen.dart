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
              horizontal: getProportionateScreenWidth(24),
              vertical: getProportionateScreenHeight(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsCard(
                    isMobile: isMobile,
                    image: Assets.images1,
                    title: AppLocalizations.of(context)!.revenueAndOperatingIncome2015,
                    subTitle: AppLocalizations.of(context)!.operatingIncome18bnWon),
                NewsCard(
                    isMobile: isMobile,
                    image: Assets.images1,
                    title: AppLocalizations.of(context)!.revenueAndOperatingIncome2015,
                    subTitle: AppLocalizations.of(context)!.operatingIncome18bnWon),
              ],
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
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
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 280,
              width: 280,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 6,
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
                  isMobile
                      ? const SizedBox.shrink()
                      : SizedBox(height: getProportionateScreenHeight(150)),
                  Row(
                    children: [
                      Image.asset('assets/images/news_fa.png'),
                      const SizedBox(width: 2),
                      Image.asset('assets/images/news_twr.png'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
