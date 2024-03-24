import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class ContactScreen extends StatelessWidget {
  final bool isMobile;
  const ContactScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Contact', image: Assets.imagesBgTopContact),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(30),
              right: getProportionateScreenWidth(30)),
          child: Container(
            color: AppColors.kMainBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Assets.imagesMapIcon1),
                        const SizedBox(
                          width: 16,
                        ),
                        Text.rich(
                          TextSpan(
                            text: '3F, Textile Center\n',
                            style: Theme.of(context).textTheme.labelLarge,
                            children: [
                              TextSpan(
                                text:
                                    ' 518, Teheran-ro, Gangnam-gu, Seoul, 135-713, Korea',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 12,
                                      color: const Color(0xFF333333),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Assets.imagesMapIcon2),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          '82-2-528-3900',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: const Color(0xFF333333),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Assets.imagesMapIcon3),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          '82-2-528-3900',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: const Color(0xFF333333),
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.zero,
                      height: getProportionateScreenHeight(100),
                      width: getProportionateScreenWidth(100),
                      color: AppColors.kGreen,
                      child: Image.asset(Assets.imagesMapBtn2En))
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
      ],
    );
  }
}

class TypeContainer extends StatelessWidget {
  final String image;
  const TypeContainer({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(275),
        width: getProportionateScreenWidth(275),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.only(right: 20),
        decoration: const BoxDecoration(
          color: AppColors.kWhite,
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFcccccc),
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Image.asset(image),
        ));
  }
}
