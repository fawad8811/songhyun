import 'package:songhyun/utils/app_exports.dart';

class PageHead extends StatelessWidget {
  final String title;
  final String image;
  const PageHead({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(450),
      decoration: BoxDecoration(
        color: AppColors.kMainBackgroundColor,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: getProportionateScreenHeight(10),
            left: getProportionateScreenWidth(20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.kWhite),
            ),
          ),
        ],
      ),
    );
  }
}
