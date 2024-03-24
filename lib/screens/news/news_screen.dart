import 'package:easy_localization/easy_localization.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

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
                    title: 'revenueAndOperatingIncome2015'.tr(),
                    subTitle: 'operatingIncome18bnWon'.tr()),
                NewsCard(
                    isMobile: isMobile,
                    image: Assets.images1,
                    title: 'establishedKCrowdFund'.tr(),
                    subTitle: 'newVentureAssociation'.tr()),
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
      color: Colors.red,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: getProportionateScreenHeight(280),
            width: getProportionateScreenWidth(280),
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
                    : SizedBox(height: getProportionateScreenHeight(180)),
                Row(
                  children: [
                    Image.asset(Assets.images1),
                    const SizedBox(width: 8),
                    Image.asset(Assets.images1),
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
