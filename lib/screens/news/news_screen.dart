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
                  title:
                      'Revenue and operating income of Songhyun Investment for 2015 grew twice as much compared to the same period in 2014, growing steady and strong.',
                  subTitle:
                      'Songhyun Investment recorded 1.8bn won in operating income, marking an increase of 198.4% compared with the prior year. Operating revenue and profit for the year recorded 4.2bn won (60.1% YoY), 1.5bn won (55.8% YoY) respectively.',
                ),
                NewsCard(
                  isMobile: isMobile,
                  image: Assets.images1,
                  title:
                      'Songhyun Investment established a new 4.7bn won sized-fund called K-Crowd Fund.',
                  subTitle:
                      'Songhyun Investment formed a new venture association to provide support to early-stage startups and provide more insights about crowdfunding. The Company was selected as a GP to manage the K-Crowd fund by Korea Growth Investment Corp.',
                ),
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
      ),
    );
  }
}
